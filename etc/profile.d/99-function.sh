#99-function.sh
#Auto cd to directory listed
cd(){
 builtin cd "$@"&&ls --color
}
#mkdir
mkd(){
 export USAGE='USAGE: mkd ${ SOME DIR(S) }'
 if [ ! -z $1 ];then
  if [ "$1" == 'build' ];then
   mkdir -vp build&&cd build/
  else mkdir -vp "$@";fi
 else usage;fi
}
#ssh run
sshr(){
 export USAGE='USAGE: sshr ${ COMMAND } ${ SOMEONE@SOME IP }'
 if [ ! -z $1 ];then ssh -X -f "$2" "$1";else usage;fi
}
#hashtag
hashtag(){
 if [ ! -z $1 ];then for INT in $(seq 1 "$1");do echo -n '#';done;echo;else usage;fi
}
#bleachbit
bleach(){
 for BLEACH in $(bleachbit --list-cleaners|grep -v 'free_disk_space'|grep -v 'memory');do bleachbit --clean --overwrite "$BLEACH";sync;done
}
#error check
errchk(){
 if [ "$?" != '0' ];then echo -e "\n$(hashtag 8)\nPrevious command: $0\n\nSOMETHING WENT WRONG!\n\n";usage;read NULLVAR;fi
}
