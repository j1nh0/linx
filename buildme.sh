#!/bin/bash -
export APTINSTALL='rsync'
export APTPURGE='aide'
export ARCH=$(uname -p)
export AUTHORIZED='authorized_keys'
export BASHHISTORY='.bash_history'
export BASHRC='.bashrc'
export BIN='bin'
export BRANCH='main'
export DATE=$(date)
export DEV='dev'
export DOTHIDDEN='dothidden'
export ENC='enc'
export ETC='etc'
export EXIT0=0
export EXIT1=1
export EXIT2=2
export FAILMESS='\n\nREPO SYNC FAIL!'
export GDM3='gdm3'
export GITC='gitc'
export HBIN='.bin'
export HOSTNAME=$(hostname)
export HREPO='.repo'
export HSSH='.ssh'
export HTTPS='https'
export J1NH0='j1nh0'
export LINX='linx'
export LOCALM='local_manifests'
export MESSAGE='Please try again with admin privs.'
export OWNER='1001:65534'
export PASSMESS='\n\nREPO SYNC PASS!'
export PERMDAEMON='0600'
export PERMETCSKEL='0755'
export PERMJD='0775'
export PERMRCL='0750'
export PWD=$(pwd)
export RCL='rcl'
export RCLSERVICE='rcl-init.service'
export REPO='repo'
export ROOT='root'
export SAMBA='samba'
export SERVICE='service'
export SHADOW='shadow'
export SHARE='share'
export SKEL='skel'
export SSH='ssh'
export SYSTEMD='systemd'
export SYSTEM='system'
export TIMESTAMP='time.stamp'
export TMP='tmp'
export UNATTENDED='unattended-upgrades'
export URLARCHIVE='https://archive.ubuntu.com'
export URLGIT='https://github.com'
export URLRAW='https://raw.githubusercontent.com'
export USAGE='USAGE: bldme ${ cubic | rcl | commons | cisstig | repo }'
export USER='j1nh0'
export WHOAMI=$(whoami)
case "$1" in
 cubic)
  if dig +short 'https://raw.githubusercontent.com';then wget -O '/bin/buildme.sh' 'https://raw.githubusercontent.com/j1nh0/linx/main/buildme.sh';fi;if [ -f '/bin/buildme.sh' ];then chmod 0755 '/bin/buildme.sh';chown root:root '/bin/buildme.sh';fi;if [ -f '/bin/buildme.sh' ];then bash '/bin/buildme.sh' rcl;fi
  if dig +short 'https://raw.githubusercontent.com';then wget -O '/bin/buildme.sh' 'https://raw.githubusercontent.com/j1nh0/linx/main/buildme.sh';fi;if [ -f '/bin/buildme.sh' ];then chmod 0755 '/bin/buildme.sh';chown root:root '/bin/buildme.sh';fi;if [ -f '/bin/buildme.sh' ];then bash '/bin/buildme.sh' commons;fi
  if dig +short 'https://raw.githubusercontent.com';then wget -O '/bin/buildme.sh' 'https://raw.githubusercontent.com/j1nh0/linx/main/buildme.sh';fi;if [ -f '/bin/buildme.sh' ];then chmod 0755 '/bin/buildme.sh';chown root:root '/bin/buildme.sh';fi;if [ -f '/bin/buildme.sh' ];then bash '/bin/buildme.sh' cisstig;fi
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
  for JD in /samba/share/ /etc/skel/.bin /iso/ /j1nh0/;do if [ ! -d "$JD" ];then mkdir -vp "$JD";chmod "$PERMJD" "$JD";chown "$JD";fi;done
  #BASHRC
  if dig +short "$URLRAW";then wget -O /"$ETC"/"$SKEL"/"$BASHRC" "$URLRAW"/"$J1NH0"/"$LINX"/"$BRANCH"/"$BASHRC";fi
  if [ -f /"$ETC"/"$SKEL"/"$BASHRC" ];then chmod 0644 /"$ETC"/"$SKEL"/"$BASHRC";chown "$ROOT":"$ROOT" /"$ETC"/"$SKEL"/"$BASHRC";fi
  #ETCSKELBIN
  if [ -d /"$ETC"/"$SKEL"/"$HBIN"/ ];then if dig +short "$URLRAW";then wget -qO- "$URLRAW"/"$J1NH0"/"$LINX"/"$BRANCH"/sh.tar|tar x --strip-components=3 -C /"$ETC"/"$SKEL"/"$HBIN"/;fi;fi
  ################################################################
  #SERVICE ACCOUNT AND USER RESET
  if ! grep "$HOSTNAME" /"$ETC"/"$SHADOW";then useradd -m "$HOSTNAME";fi
  if [ ! -d /home/"$HOSTNAME" ];then mkhomedir_helper "$HOSTNAME";fi
  if grep "$HOSTNAME" /"$ETC"/"$SHADOW";then passwd -d "$HOSTNAME";usermod -L "$HOSTNAME";fi
  #SSHD RESET
  if [ -f /$ETC/"$SSH"/sshd_config ];then sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /"$ETC"/"$SSH"/sshd_config;fi
  #WAYLAND RESET
  if [ -f /$ETC/"$GDM3"/custom.conf ];then sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /"$ETC"/gdm3/custom.conf;fi
  #HOME DIRECTORY USER RESET
  if [ -d /home ];then cd /home
   for HOMEDIR in $(ls -d */);do export HOMEUSER="${HOMEDIR%%*/}"
    if [ ! -d "$HOMEUSER"/"$HSSH"/ ];then mkdir -vp "$HOMEUSER"/"$HSSH"/;fi
    if [ -d "$HOMEUSER"/"$HSSH"/ ];then >"$HOMEUSER"/"$HSSH"/"$AUTHORIZED";fi
    if [ -f "$HOMEUSER"/"$BASHHISTORY" ];then >"$HOMEUSER"/"$BASHHISTORY";fi
   done;cd
  fi
  #KEY EXCHANGE
  if [ -f /"$ETC"/"$SSH"/"$DOTHIDDEN".piv ];then
   #SSH AGENT RESET
   eval $(ssh-agent -s);ssh-add -D;ssh-add /"$ETC"/"$SSH"/"$DOTHIDDEN".piv
   #DOTHIDDEN UNPACK
   if dig +short "$URLRAW";then git clone --depth=1 "$SSH"://git@github.com/"$J1NH0"/"$DOTHIDDEN"
    if [ -d "$DOTHIDDEN" ];then cd "$DOTHIDDEN";fi
    if [ -f ./"$HOSTNAME"."$SERVICE"."$ENC" ];then bash /"$ETC"/"$SKEL"/"$HBIN"/turnkey u ./"$HOSTNAME"."$SERVICE"."$ENC" /"$ETC"/"$SSH"/"$HOSTNAME".piv;fi
    if [ -f ./"$HOSTNAME"."$SERVICE" ];then
     #SERVICE OVERWRITE
     if [ -f ./"$HOSTNAME"."$SERVICE" ];then mv ./"$HOSTNAME"."$SERVICE" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/;fi
     #PERMISSIONS CORRECTION
     if [ -f /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE" ];then chmod "$PERMDAEMON" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE";chown "$ROOT":"$ROOT" /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE";fi
     #SYSTEMD MANAGEMENT
     if [ -f /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE" ];then systemctl enable /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE";fi
     if [[ $(systemctl is-active --quiet "$HOSTNAME"."$SERVICE") == '0' ]];then systemctl stop /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE";fi
#     systemctl daemon-reload
     if [ -f /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$HOSTNAME"."$SERVICE" ];then systemctl start "$HOSTNAME"."$SERVICE";fi
    fi
   fi
   #CLEANUP
   cd ..;rm -rf "$DOTHIDDEN";ssh-add -D;eval $(ssh-agent -k)
  fi
  ################################################################
  #HOSTNAME LOGIC
  if [ "$HOSTNAME" != 'bacon' ];then if [ -f /"$ETC"/"$SKEL"/"$HBIN"/aptinstall ];then bash /"$ETC"/"$SKEL"/"$HBIN"/aptinstall repo;fi;fi
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/aptinstall ];then bash /"$ETC"/"$SKEL"/"$HBIN"/aptinstall;fi
  if [ "$HOSTNAME" != 'bacon' ];then if [ -f /"$ETC"/"$SKEL"/"$HBIN"/update ];then bash /"$ETC"/"$SKEL"/"$HBIN"/update install;fi;fi
  if [ -d /"$ETC"/"$SKEL"/"$HBIN"/ ];then chmod -R "$PERMETCSKEL" /"$ETC"/"$SKEL"/"$HBIN"/;chown -R "$ROOT":"$ROOT" /"$ETC"/"$SKEL"/"$HBIN"/;fi
  #SYSTEM CLEANUP
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
