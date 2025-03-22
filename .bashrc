#!/bin/bash -
#KALI
case $- in
 *i*)
 ;;
 *)
  return
 ;;
esac
#VARIABLE DECLARE
export APTINSTALL='rsync'
export APTPURGE='aide'
export ARCH=$(uname -p)
export AUTHORIZED='authorized_keys'
export DOTBASHHISTORY='.bash_history'
export BASHRC='.bashrc'
export BIN='bin'
export BRANCH='main'
export D='d'
export DATE=$(date)
export DEV='dev'
export DOTHIDDEN='dothidden'
export ENC='enc'
export ETC='etc'
export EXIT0=0
export EXIT1=1
export EXIT2=2
export MESSFAIL='\n\nREPO SYNC FAIL!'
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
export MESSPASS='\n\nREPO SYNC PASS!'
export PERMDAEMON='0600'
export PERMDIR=0755
export PERMETCSKEL='0755'
export PERMFIL=0644
export PERMJD='0775'
export PERMRCL='0750'
export PWD=$(pwd)
export RCL='rcl'
export RCLSERVICE='rcl-init.service'
export RCLSERVICEDIR=/etc/systemd/system/rcl-init.service.d
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
export URLGITHUB='https://github.com'
export URLRAW='https://raw.githubusercontent.com'
export USAGE='USAGE: bldme ${ cubic | rcl | commons | cisstig | repo }'
export WHOAMI=$(whoami)
export OVERRIDE=override.conf
export FULLPATHLINX=j1nh0/linx/main
export FULLPATHDAEMON=etc/systemd/system
export PERMROOTFIL=0600
export PERMROOTDIR=0700
export CUBIC=cubic
export URLGITHUB=https://github.com
export ROOT=root
export OVERRIDE=override.conf
export PERMDIR=0755
export PERMFIL=0644
export PERMROOTDIR=0700
export PERMROOTFIL=0600
export RCL=rcl
export ETC=etc
export MAIN=main
export ZIP=zip
export JLINX=j1nh0/linx
export ARCHIVE=archive
export DOTBASHRC=.bashrc
export DOTBIN=.bin
export LINXMAINDIR=linx-main
export PERMROOTDIR=0700
export PERMROOTFIL=0600
export HOSTNAME=$(hostname)
export CUBIC=cubic
################################################################
export HISTCONTROL=ignoreboth
export HISTSIZE=100
export HISTFILESIZE=200
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export DEBIAN_FRONTEND=noninteractive
export ACCEPT_EULA=Y
export NPROC=$(nproc --ignore=1)
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
#STANDARD CANTRIPS
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias df='df -h'
alias du='du -sh'
alias cp='cp -Rfv'
alias mv='mv -v'
alias nn='nano -ic'
alias rr='rm -rf'
alias cub='cubic -v &> /dev/null &'
alias dfs="df|grep 'Filesystem'&&df|grep -v 'Filesystem'|sort"
alias dfw='while true;do df -h;date;sleep 1;clear;done'
alias fdl='fdisk -l'
alias ipa='ip addr'
mkd(){
 export USAGE='USAGE: mkd ${ SOME DIR(S) }'
 if [ ! -z $1 ];then
  if [ "$1" == 'build' ];then
   mkdir -vp build&&cd build/
  else mkdir -vp "$@";fi
 else usage;fi
}
alias mkt='mkdir -vp ./tmp/&&cd ./tmp/'
alias scp='scp -r'
alias ssh='ssh -X'
alias top='top -1'
alias free='free -h'
alias grep='grep --color'
alias hold='echo HOLDING&&read NULLVAR'
alias less='less -N'
alias nano='nano -ic'
alias ping='ping -c 4'
sshr(){
 export USAGE='USAGE: sshr ${ COMMAND } ${ SOMEONE@SOME IP }'
 if [ ! -z $1 ];then ssh -X -f "$2" "$1";else usage;fi
}
#LISTING
alias cl='clear;ls --color'
alias l1='ls -1 --color'
alias la='ls -a --color'
alias lb='lsblk'
alias lc='lscpu'
alias ld='ls -d */'
alias li='ls -i --color'
alias ll='ls -l1Ah --color'
alias lt='ls -1t --color'
alias lU='ls -1U --color'
alias lx='ls -x --color'
alias lsd='ls -1 --color /dev/sd*'
alias cl1='clear;sync;ls -h1 --color'
alias cla='clear;sync;ls -ha --color'
alias cll='clear;sync;ls -lh --color'
alias cls='clear;sync;ls -h --color'
alias wcl='ls|wc -l'
#APT
alias apt='ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends'
alias apti='apt install "$@"'
alias aptc='apt -y clean'
alias aptac='apt -y autoclean'
alias aptar='apt -y autoremove'
alias aptf='apt install -f -y'
alias aptp='apt purge "$@"'
#TRAVERSAL
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias ............='cd ../../../../../../../../../../../'
alias .............='cd ../../../../../../../../../../../../'
#SHOPT
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s expand_aliases
#TEST
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#DETERMINE CHROOT
if [ -z "${debian_chroot:-}" ]&&[ -r /etc/debian_chroot ];then debian_chroot=$(cat /etc/debian_chroot);fi
#COLOR CONTROL
case "$TERM" in xterm-color|*-256color) color_prompt=yes;;esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ];then if [ -x /usr/bin/tput ]&&tput setaf 1>&/dev/null;then color_prompt=yes;else color_prompt=;fi;fi
if [ "$color_prompt" = yes ];then
 VIRTUAL_ENV_DISABLE_PROMPT=1
 prompt_color='\[\033[;32m\]'
 info_color='\[\033[1;34m\]'
 prompt_symbol=' ♠ ♦ ♣ ♥  '
 if [ "$EUID" -eq 0 ];then # Change prompt colors for root user
  prompt_color='\[\033[;94m\]'
  info_color='\[\033[1;31m\]'
  prompt_symbol=' ☥ '
 fi
 PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
else PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ';fi
unset color_prompt force_color_prompt
#TERMINAL CONTROL
case "$TERM" in
 xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
 *);;
esac
#SOURCE ALIASES
if [ -f ~/.bash_aliases ];then . ~/.bash_aliases;fi
if ! shopt -oq posix;then if [ -f /usr/share/bash-completion/bash_completion ];then . /usr/share/bash-completion/bash_completion;elif [ -f /etc/bash_completion ];then . /etc/bash_completion;fi;fi
#UPON LOGIN
#cd $HOME
cd $HOME
#/etc/skel/.bin
if [ -d /etc/skel/.bin/ ];then
 if [ ! -d ~/.bin ];then mkdir ~/.bin/;fi
 cp -Ru /etc/skel/.bin/* ~/.bin/
 if [ -d ~/.bin ];then PATH=$PATH:~/.bin;fi
fi
#/opt/mssql-tools/bin
if [ -d /opt/mssql-tools/bin ];then PATH=$PATH:/opt/mssql-tools/bin;fi
#~/.local/bin
if [ -d ~/.local/bin ];then PATH=$PATH:~/.local/bin;fi
#Auto cd to directory listed
cd(){
 builtin cd "$@"&&ls --color
}
#Error check
errchk(){
 if [ "$?" != '0' ];then echo -e "\n$(hashtag 8)\nPrevious command: $0\n\nSOMETHING WENT WRONG!\n\n";usage;read NULLVAR;fi
}
#SKELETON
#YOU PROBABLY DON'T WANT TO TOUCH THIS
#skel
skel(){
 if [ $(id -u) != 'root' ];then if [ ! -d /etc/skel/.bin/ ];then mkdir -vp /etc/skel/.bin/&&chmod -R 755 /etc/skel/.bin/&&chown -R root:root /etc/skel/.bin/;fi;fi
 if [ -d /etc/skel/.bin/ ];then if [ ! -d ~/.bin/ ];then mkdir -vp ~/.bin/&&rsync --recursive --whole-file --human-readable --verbose --update /etc/skel/.bin/ ~/.bin/;fi;fi
}
#etcskel
etcskel(){
 export USAGE='USAGE: etcskel ${ m(irror) || r(emote) }'
 case "$1" in
  m|mirror)mirror /etc/skel/.bin/ ~/.bin/;;
  r|remote)
   skel
   wget -O "/etc/skel/.bashrc" https://raw.githubusercontent.com/j1nh0/linx/main/.bashrc&&chmod 0644 /etc/skel/.bashrc
   wget -qO- https://raw.githubusercontent.com/j1nh0/linx/main/sh.zip|busybox unzip - -d /etc/skel/.bin&&chmod -R 0755 /etc/skel/.bin/
  ;;
  *)usage;;
 esac
}
#freshenup
freshenup(){
 cat /etc/skel/.bashrc > ~/.bashrc
 source ~/.bashrc
 skel
 sync
}
#ALPHABET
a(){
 export USAGE='USAGE: a ${SOME FILE/FOLDER}'
 if [ ! -z $1 ];then
  export ARG="$1"
  export TAR="$(realpath -s $1)-$(date +%Y%m%d).tgz"
  export SEVENZ="$TAR.7z"
  find "$1" -print0|sort -z|tar --use-compress-program=pigz -cvf "$TAR" --null --no-recursion -T -;errchk
  rm -rf "$ARG";errchk
  7z a "$SEVENZ" "$TAR";errchk
  rm -rf "$TAR";errchk
 else usage;fi
}
b(){
 export USAGE='USAGE: backup ${SOMEFILE || DIR}'
 case "$1" in
  usage)usage;;
  *)if [ ! -z $1 ];then cp -rf "$1" "${1##*/}.bckp";sync;else usage;fi;;
 esac
}
alias c='clear'
d(){
 if [ ! -z "$1" ] && [ ! -z "$2" ]; then
  if [ -e "$1" ]; then
   export BS=$(fdisk -l "$1" | grep 'Sector size' | cut -d '/' -f3 | cut -d ' ' -f2)
   export COUNT=$(fdisk -l "$1" | head -1 | cut -d ',' -f3 | cut -d ' ' -f2)
   dd if="$1" of="$2" bs=$BS count=$COUNT status=progress && sync
  else
     echo 'Please provide a valid INPUT!'
  fi
 else
  echo 'Please provide an INPUT and an OUTPUT for dd!'
 fi
}
e(){
 clear
 echo '################################'
 echo 'Battery percentage is: '
 echo
 echo $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d ' ' -f15-)
 echo '################################'
 echo 'RAM info:'
 echo
 free -h
 echo '################################'
 echo 'CPU info:'
 echo
 lscpu | grep -e 'CPU(s):' -e 'Thread(s):' -e 'Core(s):' -e 'Model name:' -e 'CPU max' -e 'L3 cache:' -e 'Socket(s):' | grep -v 'NUMA'
 echo '################################'
 echo 'Temps:'
 echo
 paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -t | sed 's/...$/^C/'
 echo '################################'
 ps -a
 echo '################################'
 df -h|grep -e media -e j1nh0 -e mnt -e iso -e ramdisk
 echo '################################'
 mpstat
 echo '################################'
 date
 echo '################################'
 sleep 1
}
f(){
 if [ ! -z $1 ]; then
  firefox "$1" &> /dev/null &
 else
  firefox &> /dev/null &
 fi
}
g(){
 export USAGE='USAGE: g #STANDALONE FOR GPARTED# ${ c(ompile) | x(cross compile) | d(ebug)} ${SOME C FILE}'
 export PROGRAM="${2%.*}"
 if [ ! -z $1 ];then
  case $1 in
   c)export FLAGS='--static';;
   d)export FLAGS='--static -ggdb';;
   x)export FLAGS='--static';;
   *)echo $USAGE;;
  esac
  if [ ! -z $2 ];then
   if [ "$1" == 'x' ];then
    aarch64-linux-gnu-gcc -o $PROGRAM $2 $FLAGS
   else gcc -o $PROGRAM $2 $FLAGS;fi
   if [ "$1" == 'c' ];then
    strip $PROGRAM
    strip --strip-all $PROGRAM
    strip --strip-debug $PROGRAM
   fi
  else echo $USAGE;fi
 else sudo gparted &> /dev/null & fi
}
alias h='cd $HOME'
alias ht='htop'
alias i='clear;tree --du -h'
alias j='sudo su -'
k(){
 while true;do
  for INT in $(seq 1 4);do
   case "$INT" in
    1)echo -e "\n<(^_^<)\n";;
    2)echo -e "\n\t^(^_^)^\n";;
    3)echo -e "\n\t\t(>^_^)>\n";;
    4)echo -e "\n\t^(^_^)^\n";;
   esac
   echo -e "\nWHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)"
   sleep .5
   clear
  done
 done
}
alias l='ls --color'
alias mo='mount'
alias mot='mount|column -t'
alias mots='mount|column -t|sort'
alias n='nano -ic'
o(){
 if [ ! -z $1 ] ; then
  export PACKAGE="${1%/}"
  export USAGE='\nUsage: o ${OBJECT} a/e/l/p/x\n\nPlease use:\n\ta\tto archive\n\te\tto extract WITHOUT directories\n\tl\tto list\n\tp\tto protect\n\tx\tto extract WITH directories\n'
  oremoved(){
   echo 'Object removed!'
  }
  case "$2" in
   a)
    7z a "$PACKAGE.7z" "$1"
    if [ "$?" == '0' ];then
     rm -rf "$1"
     echo 'Object removed!'
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   e)7z e "$PACKAGE";;
   l)7z l "$PACKAGE";;
   p)
    if [ -f "$PACKAGE.7z" ] ; then
     rm "$PACKAGE.7z"
     oremoved
    fi
    echo 'Creating new package!'
    7z a "$PACKAGE.7z" "$1" -p
    if [ "$?" == '0' ] ; then
     rm -rf "$1"
     oremoved
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   x)7z x "$PACKAGE"&&rm "$PACKAGE";echo 'Old package removed!';;
   *)usage;;
  esac
 else
  o help################################
 fi
}
alias p='poweroff'
alias q='echo "FILLER"'
alias r='reboot'
alias s='sync'
t(){
 export USAGE='USAGE: t ${FILE}'
 if [ ! -z $1 ];then
  export ARG="$1"
  export SEVENZ="$(realpath -s $ARG)-$(date +%Y%m%d).7z"
  7z -v48m a "$SEVENZ" "$ARG"
  if [ "$?" == '0' ];then rm -rf "$ARG";else kickchk;fi
 else usage;fi
}
alias u='sudo umount'
alias v='veracrypt&>/dev/null &'
wi(){
 if [ -d '$RECYCLE.BIN' ];then rm -rfv '$RECYCLE.BIN';fi #Clean recycle bin
 if [ -d 'System Volume Information' ];then rm -rfv 'System Volume Information';fi #Clean system volume information
 if [ -f 'rescuepe.log' ];then rm -rfv 'rescuepe.log';fi #Clean rescuepe log
 if [ -f 'pagefile.sys' ];then rm -rfv 'pagefile.sys';fi #Clean pagefile.sys
 if [ -f 'DumpStack.log.tmp' ];then rm -rfv 'DumpStack.log.tmp';fi #Clean dump stack
 if [ -d '.Trash-999' ];then sudo rm -rfv '.Trash-999';fi #Clean .Trash-999
 if [ -d '.Trash-1000' ];then sudo rm -rfv '.Trash-1000';fi #Clean .Trash-1000
}
alias x='echo "FILLER"'
y(){
 export USAGE='USAGE: y ${ a(ll) | c(hannel) | d(epth) | k(eep) | m(usic) | mk(make) }'
 ytdlp(){
  yt-dlp -ci -f mp4 --download-archive download-archive.txt -o "%(title)s-%(id)s.%(ext)s" -v $(cat ./target.txt)
 }
 case "$1" in
  a|all)if [ ! -z $2 ];then for DIR in $(ls -d */);do cd "$DIR";y "$2";cd ..;sync;done;else usage;fi;;
  c|channel)ytdlp;;
#########THIS NEEDS WORK########
  d|depth)for URL in $(cat target.txt);do yt-dlp -ci -f mp4 --download-archive download-archive.txt -o "%(title)s-%(id)s.%(ext)s" -v "$URL";done;;
################################
  k|keep)ytdlp;mp42mp3 -k;;
  m|music)ytdlp;mp42mp3;;
  mk|make)touch download-archive.txt target.txt;nano -ic target.txt;;
  *)echo "$USAGE";;
 esac
}
z(){
 if [ ! -z $1 ] ; then
  case "$1" in
   '-f'|'--full')
    echo '########'unattended-upgrades
    echo "Full zero initiated $2"
    echo '########'
    echo 'If this is correct, please hit enter; otherwise press CTRL+C!'
    echo '########'
    read NULLVAR
    dd if=/dev/zero of="$2" bs=512 status=progress
    sync
   ;;
   *)
    echo '########'
    for CYCLE in $(seq 1 7) ; do
     echo "Cycle $CYCLE"
     echo '--------'
     dd if=/dev/zero of="$1" bs=512 count=1 status=progress
     sync
     echo '########'
    done
   ;;
  esac
 else echo 'Please provide an item to zero!';fi
}
