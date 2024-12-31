#!/bin/sh

# This file builds the site with Hugo
#
# Then, it deploys the site by committing the public/ folder to a submodule
# that is linked to the dkfreitag.github.io repo
#
# Then, it commits the site source code to the davidfreitag-com repo

# Deletes the public folder from the git cache
# Deletes the public folder from the filesystem
# Re-adds the submodule

git rm -r --cached public
rm -rf public
git submodule add --force https://github.com/dkfreitag/dkfreitag.github.io.git public

# build site

printf "\033[0;32mBuilding Site...\033[0m\n"

# Build the site with Hugo
hugo -D # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go to the public folder
cd public

# Show changes and add
git status
git add -A
git status

# Commit changes
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -a -m "$msg"

printf "\033[0;32mDeploying updated site to dkfreitag.github.io...\033[0m\n"

# Push source and build repos
git push origin master --force

# Save site source to GitHub

printf "\033[0;32mSaving site source to GitHub...\033[0m\n"

# go back a directory
cd ..

# Show changes and add
git status
git add -A
git status

# Set message and commit
msg="Updates committed on $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -a -m "$msg"

# Push
git push origin master --force
