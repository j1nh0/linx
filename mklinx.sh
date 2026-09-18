#!/bin/bash -
#VARIABLE DECLARE
if [ -f ./etc/environment ];then source ./etc/environment;else echo 'No environment provided!';exit 1;fi
#FUNCTION DECLARE
cls(){
 clear;sync;ls;
};
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
};
gitcontrol(){
 if [ -d ./.git/ ];then rm -rf ./.git/;git init;git branch -m main;fi #REMOVE AND INITIALIZE GIT
  git remote add origin "$SSHGITJ1NH0/${PWD##*/}.git"
  git add -A
  git commit -m $(date +%Y%m%d%H%M%S)
  git push -f -v origin main
  sync
};
#MAIN LOGIC
cls
printme
gitcontrol
#MAIN EXIT
exit 0
