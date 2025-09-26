#!/bin/bash -
 #OVERRIDE CONF CREATION
 echo '[Service]'>rcl-init.service.d/override.conf
  cat .bashrc|\
   grep ^export|\
    grep -v USAGE|\
     grep -v LESS_TERM|\
      sed -e "s/'//g"|\
       sed -e 's/export /Environment="/g'|\
        sed -e "s/$/\"/g"\
         >>rcl-init.service.d/override.conf
 #GIT RESET
 rm -rf ./.git/
 git init
 git branch -m main
 git remote add origin "ssh://git@github.com/j1nh0/${PWD##*/}.git"
 git add -A
 git commit -m $(date +%Y%m%d%H%M%S)
 git push -f -v origin main
exit 0
