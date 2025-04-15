#!/bin/bash -
case "$1" in
 cubic)
  clear;export URLRAW=https://raw.githubusercontent.com;if dig +short $URLRAW;then wget -q -O - $URLRAW/j1nh0/linx/main/buildme.sh|bash -s -- rcl;fi
  clear;export URLRAW=https://raw.githubusercontent.com;if dig +short $URLRAW;then wget -q -O - $URLRAW/j1nh0/linx/main/buildme.sh|bash -s -- commons;fi
  clear;export URLRAW=https://raw.githubusercontent.com;if dig +short $URLRAW;then wget -q -O - $URLRAW/j1nh0/linx/main/buildme.sh|bash -s -- cisstig;fi
  clear;export URLRAW=https://raw.githubusercontent.com;if dig +short $URLRAW;then wget -q -O - $URLRAW/j1nh0/linx/main/buildme.sh|bash -s -- rcl;fi
 ;;
 cisstig)if [ -f /linx/.bin/cisstig ];then if dig +short https://raw.githubusercontent.com;then /bin/bash /linx/.bin/cisstig 1w;fi;fi;;
 commons)
  #SOURCE ORIGINALS
  if [ -f /etc/skel/.bashrc ];then source /etc/skel/.bashrc;fi
  #SYSTEM UPDATE
  if dig +short https://archive.ubuntu.com;then
   apt-get update
   apt-get dist-upgrade -y
   if [ -f /etc/skel/.bin/aptinstall ];then /bin/bash /etc/skel/.bin/aptinstall repo;fi
   if [ -f /etc/skel/.bin/aptinstall ];then /bin/bash /etc/skel/.bin/aptinstall;fi
   apt-get dist-upgrade -y
  fi
  #SYSTEM CLEANUP
  apt-get -y autoremove
  dpkg --configure -a
 ;;
 repo)
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/"$REPO" ];then /"$ETC"/"$SKEL"/"$HBIN"/"$REPO" init --depth=0 -u "$URLGIT"/"$J1NH0"/"$REPO";fi
  if [ -d "$HREPO"/ ];then cd "$HREPO"/;fi
  if [ -d "$LOCALM"/ ];then rm -rfv "$LOCALM"/;fi
  if dig +short "$URLGIT";then git clone "$URLGIT"/"$J1NH0"/"$LOCALM";fi
  if [ -f /"$ETC"/"$SKEL"/"$HBIN"/repo ];then /"$ETC"/"$SKEL"/"$HBIN"/repo sync -c -j$(nproc --ignore=1) --force-sync&&echo -e "$MESSPASS"||echo -e "$MESSFAIL";fi
  if [ ! -d ./"$DEV"/"$GITC"/ ];then mkdir -vp ./"$DEV"/"$GITC"/;fi
  if [ -d ./"$DEV"/"$GITC"/ ];then cd ~;for GITC in $(ls -d ./dev/git/*);do 7z u -up1q0r2x1y2z1w2 -x'!*/*.git' -x'!*/*/*.git' -x'!*/*/*/*.git' -x'!*/*/*/*/*.git' -x'!*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git' ./dev/gitc/$(basename ${GITC#*/}).7z $GITC;sync;done;fi
 ;;
 rcl)
  #VARIABLE DECLARE
  export CRITICAL=critical
  export NONINTERACTIVE=noninteractive
  export DISTUPGRADE=dist-upgrade
  export AIDE=aide
  export GIT=git
  export RSYNC=rsync
  export UNATTENDED=unattended-upgrades
  export AUTHORIZED=authorized_keys
  export BIN=bin
  export BUILDME=buildme.sh
  export CLONE=clone
  export CONF=conf
  export CUBIC=cubic
  export CUSTOMCONF=custom.conf
  export DATE=$(date +%Y%m%d%H%M%S)
  export DOTBASHHISTORY=.bash_history
  export DOTBASHRC=.bashrc
  export DOTBIN=.bin
  export DOTSSH=.ssh
  export ETC=etc
  export FETCH=fetch
  export FUSE=fuse
  export GDM3=gdm3
  export HOSTNAME=$(hostname)
  export HOSTNAMESERVICE=$(hostname).service
  export HOSTNAMESERVICEDIR=$(hostname).service.d
  export INSTALL=install
  export ISO=iso
  export J1NH0=j1nh0
  export LINX=linx
  export MAIN=main
  export ORIGIN=origin
  export PERMDIR=0755
  export PERMFIL=0644
  export PERMROOTFIL=0600
  export PERMROOTOWN=root:root
  export PIV=piv
  export PURGE=purge
  export PWD=$(pwd)
  export RCLSERVICE=rcl-init.service
  export RCLSERVICEDIR=rcl-init.service.d
  export RESET=reset
  export ROOT=root
  export SAMBA=samba
  export SHADOW=shadow
  export SHARE=share
  export SKEL=skel
  export SSH=ssh
  export SSHCONFIG=ssh_config
  export SSHDCONFIG=sshd_config
  export SSHGITHUB=ssh://git@github.com
  export SYSTEM=system
  export SYSTEMD=systemd
  export TIMESTAMP=time.stamp
  export UNATTENDED=unattended-upgrades
  export UPDATE=update
  export URLRAW=https://raw.githubusercontent.com
  export WHOAMI=$(whoami)
  export SERVICE=service
  export GROUP=group
  #MANAGEMENT LOCAL
  #TIME STAMP
  echo -e "$WHOAMI::$PWD::$DATE">>/$ETC/$TIMESTAMP
  #SYSTEM
  usermod -L $ROOT
  #SSH
  if [ -f /$ETC/$SSH/$SSHCONFIG ];then sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /$ETC/$SSH/$SSHCONFIG;fi
  #SSHD
  if [ -f /$ETC/$SSH/$SSHDCONFIG ];then sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /$ETC/$SSH/$SSHDCONFIG;fi
  #WAYLAND
  if [ -f /$ETC/$GDM3/$CUSTOMCONF ];then sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /$ETC/$GDM3/$CUSTOMCONF;fi
  #FUSE MOUNT
  if [ -f /$ETC/$FUSE.$CONF ];then sed -i 's/#user_allow_other/user_allow_other/g' /$ETC/$FUSE.$CONF;fi
  #DIRECTORY
  for FORMKDIR in\
   $SAMBA\
   $ISO\
   $J1NH0\
   $SAMBA\
  ;do
   mkdir -vp /$FORMKDIR/
   if [ -e /$FORMKDIR/ ];then
    chmod $PERMDIR /$FORMKDIR/
    chown $PERMROOTOWN /$FORMKDIR/
   fi
  done
  #HOSTNAME
  if ! grep $HOSTNAME /$ETC/$SHADOW;then useradd -m $HOSTNAME;fi
  if grep $HOSTNAME /$ETC/$SHADOW;then
   mkhomedir_helper $HOSTNAME
   passwd -d $HOSTNAME
   usermod -L $HOSTNAME
  fi
  #HOME
  if [ -d /home ];then
   cd /home
   for HOMEDIR in $(ls -d */);do
    export HOMEUSER=${HOMEDIR%*/}
    if [ ! -d $HOMEUSER/$DOTSSH/ ];then mkdir -vp $HOMEUSER/$DOTSSH/;fi
    if [ -d $HOMEUSER/$DOTSSH/ ];then
     chmod $PERMDIR $HOMEUSER/$DOTSSH/
     chown $HOMEUSER:$HOMEUSER $HOMEUSER/$DOTSSH/
    fi
    for FORRESET in\
     $HOMEUSER/$DOTBASHHISTORY\
    ;do >$FORRESET;done
   done
  fi
  #ADD HOSTNAME GROUP TO J
  usermod -aG $HOSTNAME j1nh0
  #MANAGEMENT REMOTE
  #APT
  if dig +short $URLRAW;then
   apt-get $UPDATE
   apt-get $DISTUPGRADE -y
   apt-get -y $INSTALL $GIT $RSYNC $UNATTENDED
   if [ $HOSTNAME != bacon ];then apt-get -y $PURGE $AIDE;fi
   dpkg-reconfigure -f $NONINTERACTIVE -p $CRITICAL $UNATTENDED
   dpkg --configure -a
   apt-get autoremove -y
  fi
  #REBASE
  if [ -f /$ETC/$SSH/$LINX.$PIV ];then
   #ACTIVATE
   eval $(ssh-agent -s);ssh-add -D;ssh-add /$ETC/$SSH/$LINX.$PIV
   #DOWNLOAD
   if dig +short $URLRAW;then if [ -d /$LINX/ ];then cd /$LINX/&&git $FETCH --all&&git $RESET --hard $ORIGIN/$MAIN||rm -rfv /$LINX/;cd /;fi;fi
   if dig +short $URLRAW;then if [ ! -d /$LINX/ ];then git $CLONE $SSHGITHUB/$J1NH0/$LINX /$LINX/;fi;fi
   #DEACTIVATE
   ssh-add -D
   eval $(ssh-agent -k)
  fi
  #LINKS
  for FORSKEL in $DOTBIN $DOTBASHRC;do if [ -e /$LINX/$FORSKEL ];then ln -sfn /$LINX/$FORSKEL /$ETC/$SKEL/$FORSKEL;fi;done
  for FORSYSTEM in $RCLSERVICE;do if [ -e /$LINX/$FORSYSTEM ];then ln -sfn /$LINX/$FORSYSTEM /$ETC/$SYSTEMD/$SYSTEM/$FORSYSTEM;fi;done
  for FORBIN in $BUILDME;do if [ -e /$LINX/$FORBIN ];then ln -sfn /$LINX/$FORBIN /$BIN/$FORBIN;fi;done
  if [ -d /$LINX/$RCLSERVICEDIR/ ];then ln -sfn /$LINX/$RCLSERVICEDIR/ /$ETC/$SYSTEMD/$SYSTEM/$HOSTNAMESERVICEDIR;fi
  #PERMS
  if [ -d /$LINX/ ];then
   chown -R $PERMROOTOWN /$LINX/
   find /$LINX/ -type d -exec chmod $PERMDIR {} \;
   find /$LINX/ -type f -exec chmod $PERMFIL {} \;
  fi
  if [ -d /$LINX/$DOTBIN/ ];then chmod -R $PERMDIR /$LINX/$DOTBIN/;fi
  #SET SAMBA PERM
  if [ -d /samba/ ];then chown 1001:1001 /samba/;chmod 0777 /samba/;fi
  #HOSTNAME SERVICE
  if [ -f /$ETC/$SYSTEMD/$SYSTEM/$HOSTNAMESERVICE ];then
   chmod $PERMFIL /$ETC/$SYSTEMD/$SYSTEM/$HOSTNAMESERVICE
   chown $PERMROOTOWN /$ETC/$SYSTEMD/$SYSTEM/$HOSTNAMESERVICE
   ln -snf /$LINX/$RCLSERVICEDIR/ /$ETC/$SYSTEMD/$SYSTEM/$HOSTNAMESERVICEDIR
   systemctl daemon-reload
   systemctl restart $HOSTNAMESERVICE
  fi
  #SYSTEMD
  if [ $HOSTNAME != $CUBIC ];then
   if [ -f /$ETC/$SYSTEMD/$SYSTEM/$RCLSERVICE ];then
    systemctl daemon-reload
    systemctl enable $RCLSERVICE
   fi
  fi
 ;;
esac
exit 0
