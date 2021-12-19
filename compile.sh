#!/bin/sh

rm -rf public
git rm -r --cached public --force
git submodule add https://github.com/dkfreitag/dkfreitag.github.io.git public

./build_site.sh

./save_source_to_github.sh
