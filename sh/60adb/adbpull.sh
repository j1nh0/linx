#adbpull.sh
~/.bin/adbpull)
 export USAGE='USAGE: adbpull ${FOLDER}'
 if [ ! -z $1 ];then adb-sync --reverse /sdcard/"$1" "$1";else usage;fi
;;
