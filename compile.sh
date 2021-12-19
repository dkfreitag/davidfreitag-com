#!/bin/sh

# Clears the cache, removes the public folder
# (where the built site is located), and re-adds the submodule
# before 1) building the site and pushing it to
# dkfreitag.github.io and 2) pushing the source to GitHub.

git rm -r --cached public
rm -rf public
git submodule add --force https://github.com/dkfreitag/dkfreitag.github.io.git public

./build_site.sh

./save_source_to_github.sh
