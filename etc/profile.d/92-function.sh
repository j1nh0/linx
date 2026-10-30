#99-FUNCTION.SH
usage(){ echo "$USAGE"; }; #PRINT USAGE
cd(){ builtin cd "$@"&&ls --color; }; #AUTO CD AND LS DIR
mkd(){ if [ ! -z "$ARG1" ];then mkdir -vp "$@";fi; }; #MKDIR
hashtag(){ if [ ! -z "$ARG1" ];then for INT in $(seq 1 "$ARG1");do echo -n '#';done;echo;fi; }; #PRINT HASHTAG
errchk(){ if [ "$?" != '0' ];then echo "$MESSERRCHK";read NULLVAR;fi; }; #ERROR CHECK
