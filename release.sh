#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "Provide version as the first argument (patch, minor, major etc.)"
    exit 2
fi

VERSION=$1

# Publish NPM package
yarn publish "--$VERSION"
git push --follow-tags

# Publish gh-pages
git checkout gh-pages
git reset --hard master
git add -f build
git commit -m "Add distributable files for latest version"
git push -f
git checkout -

