#!/bin/bash -
#VARIABLE DECLARE
if [ -f etc/environment ];then source etc/environment;else echo 'Environment not found!';exit 1;fi
if [ -f etc/array ];then source etc/array;else echo 'Array not found!';exit 1;fi
export USAGE='USAGE: bash mklinx.sh'
#FUNCTION DECLARE
cls(){
 clear;sync;ls;
}; #CLEAR SCREEN AND SYNC
printme(){
 >"$PRINTME.$TXT"
 if [ -f "./$PRINTME.$TXT" ];then for DIR in $(ls -d */|grep -v "$OUTERRIM");do
  find "$DIR" -type f\
   -exec echo '################'>>"$PRINTME.$TXT" \;\
   -exec echo -n '#NAME='>>"$PRINTME.$TXT" \;\
   -exec echo './'{}>>"$PRINTME.$TXT" \;\
   -exec echo '################'>>"$PRINTME.$TXT" \;\
   -exec cat {}>>"$PRINTME.$TXT" \;\
   -exec echo '################'>>"$PRINTME.$TXT" \;
 done;fi
 tree -ah -I '.git'>"$INDEX"
}; #CREATE HUMAN READABLES
gitcontrol(){
 if [ -d ./.git/ ];then rm -rf ./.git/;git init;git branch -m main;fi
  git remote add origin "$SSHGITJ1NH0/${PWD##*/}.git"
  git add -A
  git commit -m $(date +%Y%m%d%H%M%S)
  git push -f -v origin main
  sync
}; #GIT CONTROL
#MAIN LOGIC
cls
printme
gitcontrol
#MAIN EXIT
exit 0
