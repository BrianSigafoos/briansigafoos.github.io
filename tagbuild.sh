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

echo "Committing Changes..."
git commit ${TAG} -m "Latest tags build"

echo "Pushing to Github..."
git push origin master
