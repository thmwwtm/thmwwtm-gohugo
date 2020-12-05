#!/bin/sh

# If a command fails then the deploy stops
set -e

# adding values to config from env
sed -i 's/thmwwtm_googleanalitycs/'"$thmwwtm_googleanalitycs"'/g' config.toml

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin main

# reset config values
printf "\033[0;32mReset config...\033[0m\n"
cd ..
sed -i 's/'"$thmwwtm_googleanalitycs"'/thmwwtm_googleanalitycs/g' config.toml
