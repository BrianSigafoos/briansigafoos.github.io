---
date: 2017-07-30 21:41:14
slug: saas-pricing-using-ppp-rates
title: Better international SaaS pricing with PPP rates
summary: How I made Playpass pricing more fair in less developed countries by
         using country PPP rates (purchasing power parity) instead of
         currency exchange rates.
---

### A good problem to solve

At the beginning of 2017, my startup [Playpass](https://playpass.com) had a
good problem. We had customers outside the US who wanted to pay for our service,
but they weren't sure how much it would cost in their local currency. At that
time, we only listed prices in USD. So these customers had to mentally convert
our prices to their currency, plus factor in any credit card exchange fees.

Since we use [Stripe](https://stripe.com) to process payments, I knew we could
charge customers in [135 currencies](https://stripe.com/docs/currencies).

But how should I set the price for each currency?

### Using exchange rates

We could just charge everyone a fixed USD amount, converted to their local
currency. Playpass is a Rails app and we use
[Ruby Money](https://github.com/RubyMoney/money) for everything money related.
Thanks to Ruby Money' exchange rate stores, we could get daily exchange rates
from the EU Central Bank or Google Currency.

But using exchange rates has two problems:

1. Prices will change too often as exchange rates change
2. Prices will be too high in less developed countries

I wanted prices that would be stable and fair.

### Using PPP rates

[Purchasing power parity](https://en.wikipedia.org/wiki/Purchasing_power_parity)
solves this for us.

> **Purchasing power parity** (PPP) is an economic theory that states that the
 exchange rate between two currencies is equal to the ratio of the currencies' respective purchasing power.

PPP can be easier to understand through the
[Big Mac Index](https://en.wikipedia.org/wiki/Big_Mac_Index), tracking how much
a Big Mac costs in different countries. For example, in 2017 a Big Mac cost
$5.06 in the US vs $1.62 (100 INR) in India.

You can download PPP rates from the
[World Bank](http://data.worldbank.org/indicator/PA.NUS.PPP?locations=US-IN)

To make things easier, here's a version of the spreadsheet I created. It has
Stripe's 135 currencies, 2016 PPP rates, and exchange rates dynamically
calculated by Google Finance.
[Google doc link](https://docs.google.com/spreadsheets/d/1hue3cBocKY3Kom2QZy7oHrzm4zKjMIOShy4dIgOMY4A/edit?usp=sharing).

<iframe width='100%' height='400' frameborder='0' src="https://docs.google.com/spreadsheets/d/1hue3cBocKY3Kom2QZy7oHrzm4zKjMIOShy4dIgOMY4A/pubhtml?widget=true&amp;headers=false"></iframe>

### Sanity checking prices

If we solely used PPP rates the range in prices would be too large. Per $100
we'd typically charge we'd receive less than $15 in Egypt and over $150 in
Bermuda. In poorest countries, PPP rates reflect staggering levels of poverty.
The don't take into account what our potential customer with a smartphone or
computer can afford to pay. PPP rates also don't take into account local
alternatives or competitors prices in that market.

![SaaS international prices](/img/posts/saas-intl-prices.png)

### Integrating PPP rates into Rails

Next we use our own formula to adjust PPP rates in column J of the spreadsheet
(for you to fill in). Then I paste the results into a YAML file for our Rails
app. Note that PPP rates are multiplied by 1,000 and stored as integers. This
follows the pattern of how to store all money related database columns, as
integers.

```YAML
# config/currency_ppp.yml
aed: 2367
# ...
usd: 1000
# ...
zmw: 4106
```

### Rake task for updating a Currency model

Then with a rake task `bundle exec rails currencies:update_ppp_rates` we grab
the data from the .yml file and save it to `Currency.ppp_rate`.

```ruby
require 'yaml'

namespace :currencies do
 desc 'Update PPP rates'
  task update_ppp_rates: :environment do
    ppp_rates = ActiveSupport::HashWithIndifferentAccess.new(YAML.load_file('config/currency_ppp.yml'))

    keys = ppp_rates.keys
    puts "Updating #{keys.size} currencies' PPP rates for SaaS pricing"

    keys.each do |k|
      Currency.find_by(code: k).update(ppp_rate: ppp_rates[k])
    end
  end
end
```

### More coming soon...

Next, I'll write more about:

* Storing PPP rates
* Dynamically calculating prices
* Dynamically creating Stripe Plans at checkout
* Dealing with currencies without a decimal place (Japanese yen, ¥1 is the smallest amount) or currencies with 1/1000 cents (Jordanian dinars) instead of 1/100 cents
