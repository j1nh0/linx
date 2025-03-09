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
export SSH='ssh'
export SYSTEM='system'
export SYSTEMD='systemd'
export TIMESTAMP='time.stamp'
export UNATTENDED='unattended-upgrades'
export URLGIT='https://github.com'
export URLRAW='https://raw.githubusercontent.com'
export URLARCHIVE='https://archive.ubuntu.com'
export USAGE='USAGE: bldme ${ cubic | rcl | commons | cisstig | repo }'
export J1NH0='j1nh0'
export WHOAMI=$(whoami)
export DOTHIDDEN='dothidden'
export TMP='tmp'
case "$1" in
 cubic)
  cd ~;if dig +short https://raw.githubusercontent.com;then curl 'https://raw.githubusercontent.com/j1nh0/linx/main/buildme.sh'|bash -s -- rcl;fi
  cd ~;if dig +short https://raw.githubusercontent.com;then curl 'https://raw.githubusercontent.com/j1nh0/linx/main/buildme.sh'|bash -s -- commons;fi
  cd ~;if dig +short https://raw.githubusercontent.com;then curl 'https://raw.githubusercontent.com/j1nh0/linx/main/buildme.sh'|bash -s -- cisstig;fi
 ;;
 rcl)cd ~
  systemctl stop "$RCLSERVICE"
  if dig +short "$URLRAW";then
   wget -O /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE" "$URLRAW"/"$J1NH0"/"$LINX"/"$BRANCH"/"$RCLSERVICE"
   if [ -f /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE" ];then
    chmod "$PERMDAEMON" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE"
    chown "$ROOT":"$ROOT" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE"
    systemctl daemon-reload
    systemctl enable "$RCLSERVICE"
   fi
  fi
 ;;
 commons)cd ~
  #KEY EXCHANGE
  if [ -f /"$ETC"/"$SSH"/"$DOTHIDDEN".piv ];then
   eval $(ssh-agent -s);ssh-add -D;ssh-add /"$ETC"/"$SSH"/"$DOTHIDDEN".piv
   if [ -d "/$TMP/" ];then cd /"$TMP"/;sync
    if dig +short "$URLRAW";then
     git clone --depth=1 "$SSH"://git@github.com/"$J1NH0"/"$DOTHIDDEN"
     if [ -f ./"$DOTHIDDEN"/"$DOTHIDDEN".sh ];then cat ./"$DOTHIDDEN"/"$DOTHIDDEN".sh|bash -s -- "$(hostname)";fi
     if [ -d ./"$DOTHIDDEN" ];then rm -rf ./"$DOTHIDDEN";fi
    fi
   fi
   ssh-add -D;eval $(ssh-agent -k)
  fi
  #TIMESTAMP
  echo -e "\n"$WHOAMI":"$WHOAMI"\nPWD:"$PWD"\n"$DATE"\n">>/"$ETC"/"$TIMESTAMP"
  #ROOT LOCKOUT
  usermod -L "$ROOT"
  #BASH RESET
  if [ -d /home ];then cd /home&&for HUSER in $(ls -d */);do >"$HUSER"/"$BASHRC";>"$HUSER"/"$BASHHISTORY";done;fi
  #SYSTEM UPGRADE
  if dig +short "$URLARCHIVE";then apt-get update;apt-get dist-upgrade -y;apt-get install -y "$APTINSTALL";apt-get purge -y "$APTPURGE";fi
  #APT UNATTENDED
  if dig +short "$URLARCHIVE";then apt-get install -y "$UNATTENDED"&&dpkg-reconfigure -f noninteractive -p critical "$UNATTENDED";fi
  #MKDIR
  for JD in "$DIRS";do if [ ! -d "$JD" ];then mkdir -vp "$JD";chmod "$PERMJD" "$JD";chown "$JD";fi;done
  #BASHRC
  if dig +short "$URLRAW";then wget -O /"$ETC"/"$SKEL"/"$BASHRC" "$URLRAW"/"$J1NH0"/"$LINX"/"$BRANCH"/"$BASHRC";fi
  if [ -f /"$ETC"/"$SKEL"/"$BASHRC" ];then chmod 0644 /"$ETC"/"$SKEL"/"$BASHRC";chown "$ROOT":"$ROOT" /"$ETC"/"$SKEL"/"$BASHRC";fi
  #ETCSKELBIN
  if [ -d /"$ETC"/"$SKEL"/"$HBIN"/ ];then if dig +short "$URLRAW";then wget -qO- "$URLRAW"/"$J1NH0"/"$LINX"/"$BRANCH"/sh.tar|tar x --strip-components=3 -C /"$ETC"/"$SKEL"/"$HBIN"/;fi;fi
  #HOSTNAME LOGIC
  if [ "$HOSTNAME" != 'bacon' ];then if [ -f /"$ETC"/"$SKEL"/"$HBIN"/aptinstall ];then bash /"$ETC"/"$SKEL"/"$HBIN"/aptinstall repo;fi;fi
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/aptinstall ];then bash /"$ETC"/"$SKEL"/"$HBIN"/aptinstall;fi
  if [ "$HOSTNAME" != 'bacon' ];then if [ -f /"$ETC"/"$SKEL"/"$HBIN"/update ];then bash /"$ETC"/"$SKEL"/"$HBIN"/update install;fi;fi
  if [ -d /"$ETC"/"$SKEL"/"$HBIN"/ ];then chmod -R "$PERMETCSKEL" /"$ETC"/"$SKEL"/"$HBIN"/;chown -R "$ROOT":"$ROOT" /"$ETC"/"$SKEL"/"$HBIN"/;fi
  apt-get -y autoremove
  apt-get clean
  dpkg --configure -a
 ;;
 cisstig)cd ~;if dig +short "$URLRAW";then curl "$URLRAW"/"$J1NH0"/"$LINX"/"$BRANCH"/sh/98cis/cisstig|bash -s -- 1w;fi;;
 repo)cd ~
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/"$REPO" ];then /"$ETC"/"$SKEL"/"$HBIN"/"$REPO" init --depth=0 -u "$URLGIT"/"$J1NH0"/"$REPO";fi
  if [ -d "$HREPO"/ ];then cd "$HREPO"/;fi
  if [ -d "$LOCALM"/ ];then rm -rfv "$LOCALM"/;fi
  if dig +short "$URLGIT";then git clone "$URLGIT"/"$J1NH0"/"$LOCALM";fi
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/repo ];then /"$ETC"/"$SKEL"/"$HBIN"/repo sync -c -j$(nproc --ignore=1) --force-sync&&echo -e "$PASSMESS"||echo -e "$FAILMESS";fi
  if [ ! -d ./"$DEV"/"$GITC"/ ];then mkdir -vp ./"$DEV"/"$GITC"/;fi
  if [ -d ./"$DEV"/"$GITC"/ ];then cd ~;for GITC in $(ls -d ./dev/git/*);do 7z u -up1q0r2x1y2z1w2 -x'!*/*.git' -x'!*/*/*.git' -x'!*/*/*/*.git' -x'!*/*/*/*/*.git' -x'!*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' ./dev/gitc/$(basename ${GITC#*/}).7z $GITC;sync;done;fi
 ;;
 *)usage;;
esac
exit 0
