#!/bin/bash -
export APTINSTALL='rsync'
export APTPURGE='aide'
export ARCH=$(uname -p)
export BASHHISTORY='.bash_history'
export BASHRC='.bashrc'
export BIN='bin'
export BRANCH='main'
export DATE=$(date)
export DEV='dev'
export DIRS='/etc/skel/.bin /iso/ /j1nh0/'
export ETC='etc'
export EXIT0=0
export EXIT1=1
export EXIT2=2
export FAILMESS='\n\nREPO SYNC FAIL!'
export GITC='gitc'
export HBIN='.bin'
export HOSTNAME=$(hostname)
export HREPO='.repo'
export HTTPS='https'
export LINX='linx'
export LOCALM='local_manifests'
export MESSAGE='Please try again with admin privs.'
export OWNER='1001:65534'
export PASSMESS='\n\nREPO SYNC PASS!'
export PERMETCSKEL='0755'
export PERMDAEMON='0640'
export PERMJD='0775'
export PERMRCL='0750'
export PWD=$(pwd)
export RCL='rcl'
export RCLSERVICE='rcl-init.service'
export REPO='repo'
export ROOT='root'
export SKEL='skel'
export SSH='https'
export SYSTEM='system'
export SYSTEMD='systemd'
export TIMESTAMP='time.stamp'
export UNATTENDED='unattended-upgrades'
export URLGIT='https://github.com'
export URLRAW='https://raw.githubusercontent.com'
export URLARCHIVE='https://archive.ubuntu.com'
export USAGE='USAGE: bldme ${ rcl | commons | repo }'
export USER='j1nh0'
export WHOAMI=$(whoami)
case "$1" in
 ultra)cd ~;;
 rcl)cd ~
  systemctl stop "$RCLSERVICE"
  if dig +short "$URLRAW";then
   wget -O /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE" "$URLRAW"/"$USER"/"$LINX"/"$BRANCH"/"$RCLSERVICE"
   if [ -f /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE" ];then
    chmod "$PERMDAEMON" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE"
    chown "$ROOT":"$ROOT" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE"
    systemctl daemon-reload
    systemctl enable "$RCLSERVICE"
   fi
  fi
 ;;
 commons)cd ~
  #TIMESTAMP
  echo -e "\n"$WHOAMI":"$WHOAMI"\nPWD:"$PWD"\n"$DATE"\n">>/"$ETC"/"$TIMESTAMP"
  #ROOT LOCKOUT
  usermod -L "$ROOT"
  #BASH RESET
  if [ -d /home ];then cd /home&&for USER in $(ls -d */);do >"$USER"/"$BASHRC";>"$USER"/"$BASHHISTORY";done;fi
  #SYSTEM UPGRADE
  if dig +short "$URLARCHIVE";then apt-get update;apt-get dist-upgrade -y;apt-get install -y "$APTINSTALL";apt-get purge -y "$APTPURGE";fi
  #APT UNATTENDED
  if dig +short "$URLARCHIVE";then apt-get install -y "$UNATTENDED"&&dpkg-reconfigure -f noninteractive -p critical "$UNATTENDED";fi
  #MKDIR JDgN9qGgR0pRPyD1qJoCU2WrjCypwZReyRkDdOZdW0CmN4vUBU
  for JD in "$DIRS";do if [ ! -d "$JD" ];then mkdir -vp "$JD";chmod "$PERMJD" "$JD";chown "$JD";fi;done
  #BASHRC
  if dig +short "$URLRAW";then wget -O /"$ETC"/"$SKEL"/"$BASHRC" "$URLRAW"/"$USER"/"$LINX"/"$BRANCH"/"$BASHRC";fi
  if [ -f /"$ETC"/"$SKEL"/"$BASHRC" ];then chmod 0644 /"$ETC"/"$SKEL"/"$BASHRC";chown "$ROOT":"$ROOT" /"$ETC"/"$SKEL"/"$BASHRC";fi
  #ETCSKELBIN
  if [ -d /"$ETC"/"$SKEL"/"$HBIN"/ ];then if dig +short "$URLRAW";then wget -qO- "$URLRAW"/"$USER"/"$LINX"/"$BRANCH"/sh.tar|tar x --strip-components=3 -C /"$ETC"/"$SKEL"/"$HBIN"/;fi;fi
  #HOSTNAME LOGIC
  if [ "$HOSTNAME" != 'bacon' ];then if [ -f /"$ETC"/"$SKEL"/"$HBIN"/aptinstall ];then bash /"$ETC"/"$SKEL"/"$HBIN"/aptinstall repo;fi;fi
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/aptinstall ];then bash /"$ETC"/"$SKEL"/"$HBIN"/aptinstall;fi
  if [ "$HOSTNAME" != 'bacon' ];then if [ -f /"$ETC"/"$SKEL"/"$HBIN"/update ];then bash /"$ETC"/"$SKEL"/"$HBIN"/update install;fi;fi
  if [ -d /"$ETC"/"$SKEL"/"$HBIN"/ ];then chmod -R "$PERMETCSKEL" /"$ETC"/"$SKEL"/"$HBIN"/;chown -R "$ROOT":"$ROOT" /"$ETC"/"$SKEL"/"$HBIN"/;fi
  apt-get -y autoremove
  apt-get clean
  dpkg --configure -a
  #KEY EXCHANGE
  if [ -f /"$ETC"/"$SSH"/dothidden.piv ];then
   eval $(ssh-agent -s);ssh-add -D
   ssh-add /"$ETC"/"$SSH"/dothidden.piv
   if dig +short "$URLRAW";then
    curl "$SSH"://"$URLRAW"/"$USER"/dothidden/dothidden.sh|bash -s -- "$(hostname)"
   fi
   ssh-add -D;ssh -o IdentityAgent=none
  fi
 ;;
 repo)cd ~
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/"$REPO" ];then /"$ETC"/"$SKEL"/"$HBIN"/"$REPO" init --depth=0 -u "$URLGIT"/"$USER"/"$REPO";fi
  if [ -d "$HREPO"/ ];then cd "$HREPO"/;fi
  if [ -d "$LOCALM"/ ];then rm -rfv "$LOCALM"/;fi
  if dig +short "$URLGIT";then git clone "$URLGIT"/"$USER"/"$LOCALM";fi
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/repo ];then /"$ETC"/"$SKEL"/"$HBIN"/repo sync -c -j$(nproc --ignore=1) --force-sync&&echo -e "$PASSMESS"||echo -e "$FAILMESS";fi
  if [ ! -d ./"$DEV"/"$GITC"/ ];then mkdir -vp ./"$DEV"/"$GITC"/;fi
  if [ -d ./"$DEV"/"$GITC"/ ];then cd ~;for GITC in $(ls -d ./dev/git/*);do 7z u -up1q0r2x1y2z1w2 -x'!*/*.git' -x'!*/*/*.git' -x'!*/*/*/*.git' -x'!*/*/*/*/*.git' -x'!*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' ./dev/gitc/$(basename ${GITC#*/}).7z $GITC;sync;done;fi
 ;;
 *)usage;;
esac
exit 0
