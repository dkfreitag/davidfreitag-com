#!/bin/sh

# If a command fails then the deploy stops
set -e

# Show changes
git status

# Update changes
git add -A

# Show new status
git status

# Set message and commit
msg="Updates committed on $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push
git push origin master -f
