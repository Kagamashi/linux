#!/bin/bash

git config --global user.name "miki"
git config --global user.email "miki@miki.com"
cat .git/config

## Staging and committing
git status 
git add # adds to staging area.
git reset file # unstage

git add “*.html”
git add “products/*.html”
git commit -m “committed mate”
git rm file.txt # removes file from Git repository

## Git Branches
# General
git branch 1.2
git checkout 1.2
git log
git show b7a3
git merge 1.2 #(in master)

# Remote
git remote -v # shows remote
git remote add origin git@github.blah # origin is an alias for the url above
ssh-keygen #(for remote)
git push origin master
git pull origin master
git clone
