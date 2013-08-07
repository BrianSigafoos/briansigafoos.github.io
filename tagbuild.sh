#!/bin/sh

TAG=tags/
SITE=site/

if [ -d ${TAG} ]; then
    echo "Deleting ${TAG} directory..."
    rm -rf ${TAG}
fi

echo "Regenerating Site..."
jekyll

echo "Copying ${TAG} ..."
cp -a ${SITE}/${TAG} ./tags
