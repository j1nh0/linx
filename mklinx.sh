#!/bin/bash -
 #OVERRIDE CONF CREATION
 cat .bashrc|\
  grep ^export|\
   grep -v USAGE|\
    sed -e 's/export /Environment="/g'|\
     sed -e "s/$/\"/g"\
      >rcl-init.service.d/override.conf
 #GIT RESET
 bash /etc/skel/.bin/gitreset
exit 0
