const { colors } = require('tailwindcss/defaultTheme')

module.exports = {
  theme: {
    colors: {
      primary: 'var(--color-primary)',
      black: colors.black,
      white: colors.white,
      gray: colors.gray,
    },
    container: { // .container applies these to center and add padding
      center: true, // mx-auto
      padding: '1.5rem', // px-6
    },
  },
  variants: {},
  plugins: []
}
