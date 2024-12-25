#msstop.sh
~/.bin/msstop)
 export USAGE='USAGE: msstop ${ MEGASYNC ID }'
 if [ ! -z $1 ];then mega-sync -s "$1";else usage;fi
;;