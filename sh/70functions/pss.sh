#pss.sh
~/.bin/pss)
 export USAGE='USAGE: pss ${ SOME PROCESS TO SEARCH }'
 case "$1" in
  usage)usage;;
  *)ps -aux|grep "$1";;
 esac
;;
