#backup.sh
~/.bin/backup)
 export USAGE='USAGE: backup ${ orig } $SOMEFILE'
 case "$1" in
  orig)if [ ! -z $2 ];then cp -rfv "$1" "${2##*/}.orig";sync;else usage;fi;;
  *)if [ ! -z $1 ];then cp -rfv "$1" "${1##*/}.bckp";sync;else usage;fi;;
 esac
;;
