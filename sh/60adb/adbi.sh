#adbi.sh
~/.bin/adbi)
 export USAGE='USAGE: adbi ${APK INSTALL}'
 if [ ! -z $1 ];then adb install "$1";else usage;fi
;;
