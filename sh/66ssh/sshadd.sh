#sshadd.sh
~/.bin/sshadd)
 export USAGE='USAGE: sshadd ${ SSH KEY }'
 export KEY="$1"
 if [ ! -z $1 ];then ssh-add -D;ssh-add "$KEY";else usage;fi
;;
