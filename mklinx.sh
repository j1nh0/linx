#!/bin/bash -
 #GIT RESET
 rm -rf ./.git/;git init;git branch -m main
 git remote add origin "ssh://git@github.com/j1nh0/${PWD##*/}.git"
 git add -A;git commit -m $(date +%Y%m%d%H%M%S);git push -f -v origin main
exit 0
