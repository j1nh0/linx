#!/bin/bash -
 #VARIABLE DECLARATION
 export KEY=$HOME/.ssh/linx.piv
 export URL=github.com
 export NULL=/dev/null
 export MESSAGE='You have no key, internet, home, or git!'
 export WHOAMI=$(whoami)
 export CHMODF=0600
 export CHMODD=0700
 export CHMODE=0750
 export REPOURL=ssh://git@github.com/j1nh0/linx.git
 export HCONFIG=$HOME/.config
 export LDIR=$HOME/.linx
 export LDIRSYSD=$LDIR/systemd
 export HBIN=$LDIR/etc/skel/.bin
 export RCLDIR=$LDIR/rcl-init
 export RCLSERVICE=$RCLDIR/rcl-init.service
 export RCLTIMER=$RCLDIR/rcl-init.timer
 export RCLLOG=$RCLDIR/rcl-init.log
 export SYSDUDIR=$HOME/.config/systemd
 export RCLU=$SYSDUDIR/user/rcl-init.service
 export SYSDFLAGS='--user'
 export BASHRC=$LDIR/etc/skel/.bashrc
 export HBASHRC=$HOME/.bashrc

#echo $HBIN
#find $HBIN -type f -exec chmod $CHMODE {} \;
#read NULLVAR

 #FUNCION DECLARATION
 syschk(){
  if [ ! -f $KEY ]||[ ! dig +time=1 $URL&>$NULL ]||[ ! command -v git&>$NULL ]||[ -z $HOME ];then echo $MESSAGE;exit 1;fi #SYSTEM CHECK
 };
 #GIT RIP
 gitrip(){
  if [ -f $KEY ];then chown $WHOAMI:$WHOAMI $KEY;chmod $CHMODF $KEY;eval $(ssh-agent -s);ssh-add $KEY;fi #SSH CHECK
  if [ ! -d $LDIR ];then git clone $REPOURL $LDIR;fi #GIT BASE CLONE
  if [ -d $LDIR ];then cd $LDIR;git fetch --all;git reset --hard origin/main;git clean -fd;fi #GIT RESET HEAD
  if [ -d $LDIR ];then find $LDIR -type d -exec chmod $CHMODD {} \; -exec chown $WHOAMI:$WHOAMI {} \;;fi #DIR PERM CHECK
  if [ -d $LDIR ];then find $LDIR -type f -exec chmod $CHMODF {} \; -exec chown $WHOAMI:$WHOAMI {} \;;fi #FILE PERM CHECK
  if [ -f $KEY ];then ssh-add -d;eval $(ssh-agent -k);sync;fi #SSH KILL
 };
 sysdu(){
  if [ ! -d $HCONFIG ];then mkdir -p $HCONFIG;fi
  if [ -e $SYSDUDIR ]&&[ ! -L $SYSDUDIR ];then rm -rf $SYSDUDIR;fi #DIR CHECK
  if [ ! -L $SYSDUDIR ];then ln -s $LDIRSYSD $SYSDUDIR;fi #LINK CHECK
  if [ -d $SYSDUDIR ];then find -type d -exec chmod -R $CHMODD {} \; -exec chown $WHOAMI:$WHOAMI {} \;;fi #DIR CHECK
  if [ -d $SYSDUDIR ];then find -type f -exec chmod -R $CHMODF {} \; -exec chown $WHOAMI:$WHOAMI {} \;;fi #DIR CHECK
 };
 rclinit(){
  if [ -f $RCLSERVICE ];then ln -s $RCLSERVICE $RCLU;fi #SERVICE LINK
  systemctl $SYSDFLAGS daemon-reload #DAEMON RELOAD
  if [ -f $RCLSERVICE ];then systemctl enable $SYSDFLAGS $RCLSERVICE;fi #SERVICE ENABLE
  if [ -f $RCLTIMER ];then systemctl enable $SYSDFLAGS $RCLTIMER;systemctl start $SYSDFLAGS rcl-init.timer;fi #TIMER START AND ENABLE
  if [ -f $RCLLOG ];then echo 'rcl-init'>>$RCLLOG;date>>$RCLLOG;fi #LOGGING
 };
 bashrcbuild(){
  if [ -e $HBASHRC ]&&[ ! -L $HBASHRC ];then rm -rf $HBASHRC;fi #BASHRC LINK TEST
  if [ ! -e $HBASHRC ];then ln -s $BASHRC $HBASHRC;fi #BASHRC LINK UP
  if [ -f $HBASHRC ];then source $HBASHRC;fi #BASHRC SOURCE
  if [ -d $HBIN ];then find $HBIN -type f -exec chmod $CHMODE {} \;;fi #HIDDEN BIN EXECUTE CAPABLE
 };
 #MAIN LOGIC
 syschk
 gitrip
 sysdu
 rclinit
 bashrcbuild
#MAIN EXIT
exit 0
