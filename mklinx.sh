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
 bash /etc/skel/.bin/gitreset
exit 0
