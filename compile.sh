#!/bin/sh

git rm -r --cached public
rm -rf public
git submodule add --force https://github.com/dkfreitag/dkfreitag.github.io.git public

./build_site.sh

./save_source_to_github.sh
