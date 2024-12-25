#msdel.sh
~/.bin/msdel)
 export USAGE='USAGE: msdel ${ MEGASYNC ID }'
 if [ ! -z $1 ];then mega-sync -d "$1";else usage;fi
;;