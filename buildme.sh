#!/bin/bash -
export USAGE='USAGE: bldme ${ rcl | repo }'
export MESSAGE='Please try again with admin privs.'
export EXIT0=0
export EXIT1=1
export EXIT2=2
export ETC='etc'
export SKEL='skel'
export BIN='bin'
export HBIN='.bin'
export SYSTEMD='systemd'
export SYSTEM='system'
export RCL='rcl'
export ARCH=$(uname -p)
export RCLSERVICE='rcl-init.service'
export URLGIT='https://github.com'
export URLRAW='https://raw.githubusercontent.com'
export USER='j1nh0'
export REPO='repo'
export LINX='linx'
export BRNCH='main'
export HREPO='.repo'
export LOCALM='local_manifests'
export PASSMESS='\n\nREPO SYNC PASS!'
export FAILMESS='\n\nREPO SYNC FAIL!'
export DEV='dev'
export GITC='gitc'
case "$1" in
 rcl)cd ~
  if dig +short "$URLRAW";then
   wget -O /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE" "$URLRAW"/"$USER"/"$LINX"/"$BRNCH"/"$RCL"/"$RCLSERVICE"
   if [ -f /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE" ];then
    chmod 0644 /"$ETC"/"$SYSTEMD"/"$SYSTEM"/"$RCLSERVICE"
    systemctl daemon-reload
    systemctl enable "$RCLSERVICE"
   fi
  fi
  cd ~;if dig +short https://raw.githubusercontent.com;then wget -O /bin/rcl.$(uname -p) https://raw.githubusercontent.com/j1nh0/linx/main/rcl/rcl.$(uname -p);if [ -f /bin/rcl.$(uname -p) ];then chmod 0750 /bin/rcl.$(uname -p);chown root:root /bin/rcl.$(uname -p);/bin/rcl.$(uname -p) &fi;fi;exit 0
  exit 0
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
#cd ~;if dig +short https://raw.githubusercontent.com;then wget -O /etc/systemd/system/rcl-init.service https://raw.githubusercontent.com/j1nh0/linx/main/rcl/rcl-init.service;if [ -f /etc/systemd/system/rcl-init.service ];then chmod 0644 /etc/systemd/system/rcl-init.service;systemctl daemon-reload;systemctl enable rcl-init.service;fi;fi
#cd ~;if dig +short https://raw.githubusercontent.com;then wget -O /bin/rcl.$(uname -p) https://raw.githubusercontent.com/j1nh0/linx/main/rcl/rcl.$(uname -p);if [ -f /bin/rcl.$(uname -p) ];then chmod 0750 /bin/rcl.$(uname -p);chown root:root /bin/rcl.$(uname -p);/bin/rcl.$(uname -p) &fi;fi;exit 0
#cd ~;for GITC in $(ls -d ./dev/git/*);do 7z u -up1q0r2x1y2z1w2 -x'!*/*.git' -x'!*/*/*.git' -x'!*/*/*/*.git' -x'!*/*/*/*/*.git' -x'!*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' ./dev/gitc/$(basename ${GITC#*/}).7z $GITC;sync;done
