#reposync.sh
~/.bin/repoinit)
 export USAGE='USAGE: repoinit ${SOME URL}'
 case "$1" in
  usage)usage;;
  *)repo init --depth=1 -u "https://github.com/$1";;
 esac
;;

