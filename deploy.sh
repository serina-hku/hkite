#!/bin/bash

# This is your first time to run this script.
# Clone the remote gh-pages into local _build folder.
# If things went south, you can remove _build folder and start this script again.
if [[ ! -e _build ]]; then
    git clone git@github.com:hupili/hkite.git -b gh-pages _build
fi

# Update to upstream
rm -rf _build/*
cd _build
git reset --hard gh-pages
git pull origin gh-pages -u
cd -

# Update to our local files
rm -rf _build/*
cp -r CNAME index.html qrcode.jpg logo.jpg l/ _build/

# Push to GitHub for hosting
cd _build
git add .
git add -u .
git commit -m "`whoami` deploy to gh-pages at `date`"
git push
cd -

