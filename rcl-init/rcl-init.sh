#!/bin/bash -
 #VARIABLE DECLARATION
 export MESSAGE='You have no key, internet, or git!'
 export KEY=$HOME/.ssh/linx.piv
 export WHOAMI=$(whoami)
 export NULL=/dev/null
 export URL=github.com
 export REPOURL=ssh://git@github.com/j1nh0/linx.git
 export CHMODD=0700
 export CHMODF=0600
 export SYSDFLAGS='--user'
 export SYSTDUDIR=$HOME/.config/systemd/user/
 export LDIR=$HOME/.linx/
 export RCL=$LDIR/rcl-init
 export RCLSERVICE=$RCL.service
 export RCLTIMER=$RCL.timer
 export RCLLOG=$RCL.log
 #FUNCION DECLARATION
 #SYSTEM, SSH, DIR CHECK
 syschk(){
  if [ ! -f $KEY ]||[ ! dig +time=1 $URL&>$NULL ]||[ ! command -v git&>$NULL ];then echo "$MESSAGE";exit 1;fi #BAD STATUS CHECK
  if [ ! -z $HOME ];then clear;cd "$HOME";fi #HOME CHECK
  if [ -f $KEY ];then chown $WHOAMI:$WHOAMI $KEY;chmod "$CHMODF" $KEY;eval $(ssh-agent -s);ssh-add $KEY;fi #SSH CHECK
  if [ ! -d "$SYSTDUDIR" ];then mkdir -p "$SYSTDUDIR";fi #DIR CHECK
  if [ -d "$SYSTDUDIR" ];then chmod -R "$CHMODD" "$SYSTDUDIR";fi #DIR CHECK
 };
 #GIT RIP
 gitrip(){
  git clone "$REPOURL" "$HLINXDIR"
 }
 #SYSTEMD MODULE LOAD
 rclinit(){
  systemctl "$SYSDFLAGS" daemon-reload
  if [ -f $RCLSERVICE ];then systemctl enable $RCLSERVICE;fi
  if [ -f $RCLTIMER ];then systemctl enable $RCLTIMER;systemctl start $RCLTIMER;fi
  echo 'rcl-init'>$RCLLOG
  date>>$RCLLOG
 };
#MAIN LOGIC
syschk
gitrip
# rclinit
#MAIN EXIT
exit 0
