#attribwalk.sh
~/.bin/attribwalk)
 export USAGE='USAGE: attribwalk ${DEV DEVICE}'
 if [ ! -z $1 ];then sudo udevadm info --attribute-walk "$1";else usage;fi
;;
