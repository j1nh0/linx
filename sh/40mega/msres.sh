#msres.sh
~/.bin/msres)
 export USAGE='USAGE: msres ${ MEGASYNC ID }'
 if [ ! -z $1 ];then mega-sync -r "$1";else usage;fi
;;