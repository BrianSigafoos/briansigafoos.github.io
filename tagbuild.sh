#!/bin/sh

TAG=tags/
SITE=site/

if [ -d ${TAG} ]; then
    echo "Deleting /${TAG} directory..."
    rm -rf ${TAG}
fi

echo "Regenerating site..."
jekyll build

echo "Copying /${TAG}..."
cp -a ${SITE}/${TAG} ./tags

echo "Committing changes..."
git commit ${TAG} -m "Rebuilt tags directory"

echo "Pushing to Github..."
git push origin master
