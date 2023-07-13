####
#00environment.sh
####
#Kali
case $- in
 *i*);;
 *) return;;
esac
#History control
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10
HISTFILESIZE=20
#Window control
shopt -s checkwinsize
#Determine chroot
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
 debian_chroot=$(cat /etc/debian_chroot)
fi
#Color control
case "$TERM" in
 xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
 if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
 else
  color_prompt=
 fi
fi
if [ "$color_prompt" = yes ]; then
 VIRTUAL_ENV_DISABLE_PROMPT=1
 prompt_color='\[\033[;32m\]'
 info_color='\[\033[1;34m\]'
 prompt_symbol=' ♠ ♦ ♣ ♥  '
 if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
  prompt_color='\[\033[;94m\]'
  info_color='\[\033[1;31m\]'
  prompt_symbol=' ☥ '
 fi
 PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
#Terminal control
case "$TERM" in
 xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
 *);;
esac
#Handy aliases
if [ -x /usr/bin/dircolors ]; then
 test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
 alias ls='ls --color=auto'
 alias dir='dir --color=auto'
 alias vdir='vdir --color=auto'
 alias grep='grep --color=auto'
 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'
 alias diff='diff --color=auto'
 alias ip='ip --color=auto'
 export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
 export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
 export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
 export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
 export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
 export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
 export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi
#Colored GCC warnings
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#Source aliases
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
 elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
 fi
fi
####
####
#Custom pathing
#[[ ":$PATH:" == *:'CUSTOMPATHHERE':* ]] || PATH=$PATH:'CUSTOMPATHHERE'
####
#/etc/skel/.bin
if [ -d /etc/skel/.bin/ ];then
 if [ ! -d ~/.bin ];then mkdir ~/.bin/;fi
 rsync --archive --human-readable --whole-file --exclude=.* --exclude=studio --exclude=sdk /etc/skel/.bin/ ~/.bin/
 if [ -d ~/.bin ];then
  PATH=$PATH:~/.bin
 fi
fi
#/opt/mssql-tools/bin
if [ -d /opt/mssql-tools/bin ];then
 PATH=$PATH:/opt/mssql-tools/bin
fi
#~/.local/bin
if [ -d ~/.local/bin ];then
 PATH=$PATH:~/.local/bin
fi
#Env variables
export DEBIAN_FRONTEND=noninteractive
export ACCEPT_EULA=Y
#Auto cd to directory listed
shopt -s autocd
cd(){
 builtin cd "$@"&&ls --color
};
#Directory traversal
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
#Standard cantrips
alias df='df -h'
alias du='du -sh'
alias cp='cp -Rfv'
alias mv='mv -v'
alias nn='nano -ic'
alias rr='rm -r'
alias cub='cubic &> /dev/null &'
alias dfw='while true;do df -h;date;sleep 1;clear;done'
alias fdl='fdisk -l'
alias ipa='ip addr'
alias mkd='mkdir -vp'
alias mkt='mkdir -vp ./tmp/&&cd ./tmp/'
alias scp='scp -r'
alias ssh='ssh -X'
alias top='top -1'
alias free='free -h'
alias grep='grep --color'
alias hold='sleep 3600'
alias less='less -N'
alias nano='nano -ic'
alias ping='ping -c 4'
alias recdrom='sudo mount -o rw,remount,rw /cdrom'
#Listing
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
alias cla='clear;sync;ls -ha --color'
alias cll='clear;sync;ls -lh --color'
alias cls='clear;sync;ls -h --color'
alias wcl='ls|wc -l'
#Sudo apt
alias apt='sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends'
####
#03alphabet.sh
####
a(){
 if [ ! -z $1 ];then
  export ARG="$1"
  export TAR="$(realpath -s "$1")-$(date +%Y%m%d).tgz"
  export SEVENZ="$(realpath -s "$1")-$(date +%Y%m%d).tgz.7z"
  find "$1" -print0|sort -z|tar --use-compress-program=pigz -cvf "$TAR" --null --no-recursion -T -
  if [ "$?" == '0' ];then
   rm -rf "$ARG"
   7z a "$SEVENZ" "$TAR"
   if [ "$?" == '0' ];then
    rm -rf "$TAR"
   else
    echo 'SOMETHING WENT WRONG AFTER 7Z!'
    read NULLVAR
   fi
  else
   echo 'SOMETHING WENT WRONG AFTER TAR!'
   read NULLVAR
  fi
 else
  echo 'USAGE: a ${SOME FILE/FOLDER}'
 fi
}
alias b='sudo mount -o bind'
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
alias g='gparted &> /dev/null &'
alias h='cd $HOME'
alias i='clear;tree --du -h'
alias j='sudo su -'
k(){
 while true;do
  for INT in $(seq 1 4);do
   if [ "$INT" == 1 ];then echo -e "\n<(^_^<)\n";else
   if [ "$INT" == 2 ];then echo -e "\n\t^(^_^)^\n";else
   if [ "$INT" == 3 ];then echo -e "\n\t\t(>^_^)>\n";else
   if [ "$INT" == 4 ];then echo -e "\n\t^(^_^)^\n"
   fi
   fi
   fi
   fi
   echo -e "\nWHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)"
   sleep .5
   clear
  done
 done
}
alias l='ls --color'
alias mo='sudo mount'
alias mot='sudo mount | column -t'
alias n='echo "FILLER!!!"'
o(){
 if [ ! -z $1 ] ; then
  export PACKAGE="${1%/}"
  case "$2" in
   a)
    7z a "$PACKAGE.7z" "$1"
    if [ "$?" == '0' ] ; then
     rm -rf "$1"
     echo 'Object removed!'
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   e)
    7z e "$PACKAGE"
   ;;
   l)
    7z l "$PACKAGE"
   ;;
   p)
    if [ -f "$PACKAGE.7z" ] ; then
     rm "$PACKAGE.7z"
     echo 'Old package removed!'
    fi
    echo 'Creating new package!'
    7z a "$PACKAGE.7z" "$1" -p
    if [ "$?" == '0' ] ; then
     rm -rf "$1"
     echo 'Object removed!'
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   x)
    7z x "$PACKAGE"
    if [ "$?" == '0' ] ; then
     rm "$PACKAGE"
     echo 'Old package removed!'
    fi
   ;;
   *)
    echo -e "
Please use:
\ta\tto archive
\te\tto extract WITHOUT directories
\tl\tto list
\tp\tto protect
\tx\tto extract WITH directories

Usage: o OBJECT a/e/l/p/x
"
   ;;
  esac
 else
  o help
 fi
}
alias p='sudo poweroff'
alias q='echo "FILLER"'
alias r='sudo reboot'
alias s='sync'
alias t='mkdir -vp ./tmp/&&cd ./tmp'
alias u='sudo umount'
alias v='veracrypt &> /dev/null &'
wi(){
 #Clean recycle bin
 if [ -d '$RECYCLE.BIN' ];then rm -rf '$RECYCLE.BIN';fi
 #Clean system volume information
 if [ -d 'System Volume Information' ];then rm -rf 'System Volume Information';fi
 #Clean rescuepe log
 if [ -f 'rescuepe.log' ];then rm 'rescuepe.log';fi
 #Clean pagefile.sys
 if [ -f 'pagefile.sys' ];then rm 'pagefile.sys';fi
 #Clean dump stack
 if [ -f 'DumpStack.log.tmp' ];then rm 'DumpStack.log.tmp';fi
 #Clean .Trash-999
 if [ -d '.Trash-999' ];then sudo rm -rf '.Trash-999';fi
 #Clean .Trash-1000
 if [ -d '.Trash-1000' ];then sudo rm -rf '.Trash-1000';fi
}
alias x='echo "FILLER"'
y(){
 if [ "$1" == '-mk' ]; then
  > download-archive.txt
  > target.txt
  nano -ic target.txt
 else
  yt-dlp -ci -f mp4 --download-archive download-archive.txt -o "%(title)s-%(id)s.%(ext)s" -v $(cat ./target.txt)
  case "$1" in
   '-m') mp42mp3;;
   '-k') mp42mp3 -k;;
   *) echo 'Usage: y -{c|m|k|mk}';;
  esac
 fi
}
z(){
 if [ ! -z $1 ] ; then
  case "$1" in
   '-f'|'--full')
    echo '########'
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
 else
  echo 'Please provide an item to zero!'
 fi
}
####
####
#04functions.sh
####
#Error check
errchk(){
 if [ "$?" != '0' ];then
  echo "SOMETHING WENT WRONG $i!"
 else
  ((i++))
 fi
}
#Skeleton creation
skel(){
 if [ $(id -u) != 'root' ];then
  if [ ! -d "/etc/skel/.bin/" ];then
   mkdir -vp "/etc/skel/.bin/"
  fi
 fi
 if [ -d /etc/skel/.bin/ ];then
  if [ ! -d ~/.bin/ ];then
   mkdir -vp ~/.bin/
  fi
  rsync --archive --human-readable --whole-file --exclude=.* --exclude=studio --exclude=sdk /etc/skel/.bin/ ~/.bin/
 else
  echo '/etc/skel/.bin/ does not exist!'
 fi
}
#Freshenup the environment
freshenup(){
 cat /etc/skel/.bashrc > ~/.bashrc
 source ~/.bashrc
 skel
 sync
}
#Set git defaults
gitdef(){
 for GITDEF in\
  "user.email 'j1nh0m3lqu1st+github@gmail.com'"\
  "user.name 'j1nh0'"\
  "credential.usageer 'cache --timeout=28800'"\
  "fetch.prune true"\
  "http.postBuffer 2097152000"\
  "init.defaultBranch main"\
  "diff.submodule log"\
  "pull.rebase false"\
 ;do
  git config --global $GITDEF
 done
}
####
#05jcc.sh
####
jcc(){
 export ORIG="$1"
 export ORIGBCKP="$1"".bckp"
 export INCLUDE='#include<assert.h>
#include<ctype.h>
#include<errno.h>
#include<math.h>
#include<signal.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<time.h>
#include<unistd.h>'
 export DEFINE='#define EQ ==
#define NE !=
#define GT >
#define LT <
#define GE >=
#define LE <=
#define PI 3.14159
#define EVER ;;
#define ECHOFLAGS (ECHO | ECHOE | ECHOK | ECHONL)'
 export INTMAIN='int main(int argc,char *argv[]){'
 export INITIALIZE='int a,b,c;
int i,j,k;
int x,y,z;
int ret=0;
char *applet=argv[0];
char *sel=argv[1];
char *sell=argv[2];
char *selll=argv[3];
char *sellll=argv[4];
char cmd[1000];
char tmpcmd[1000];
char *ec=".c";
char *esh=".sh";
char *apt="sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends";
char *dpkgreconf="sudo dpkg-reconfigure -f noninteractive -p critical";'
 export FUNCTION='void cls(){system("clear");};
void waitcls(){sleep(3);system("clear");};
void badinput(){cls();printf("\nBad input, try again!\n\n");exit(1);};
void hashtag(){printf("\n################################\n\n");};
void hold(){char hold[9];printf("Program hold:");scanf("%8s",hold);};
/*SYSTEM FUNCTIONS*/
void sync(){system("sync");};
void aptu(){sprintf(cmd,"%s update",apt);system(cmd);};
void apti(){sprintf(cmd,"%s install",apt);system(cmd);};
/*HARD FUNCTIONS*/
int isDir(const char *fileName){struct stat path;stat(fileName, &path);return S_ISREG(path.st_mode);};'
 export MAINLOGIC=$(cat "$1")
 export MAINRETURNCLOSE='return(0);};'
####COMMENT OUT DEBUG VERSION####
####THIS NEEDS WORK####
# cat << EOF >> "${1%.*}.working.c"
 cat << EOF | gcc -xc -o "${1%.*}" --static -
$INCLUDE
$DEFINE
$INTMAIN
$INITIALIZE
$FUNCTION
$MAINLOGIC
$MAINRETURNCLOSE
EOF
 if [ "$?" == '0' ];then echo -n "GCC ${1%.*} pass,";else echo 'SOMETHING WENT WRONG WITH GCC!';read NULLVAR;fi
 if [ "$?" == '0' ];then echo -n " strip";strip "${1%.*}";else echo 'SOMETHING WENT WRONG WITH BACKUP!';fi
 if [ "$?" == '0' ];then echo -n " pass, strip-all";strip --strip-all "${1%.*}";else echo 'SOMETHING WENT WRONG WITH STRIP!';fi
 if [ "$?" == '0' ];then echo -n " pass, strip-debug";strip --strip-debug "${1%.*}";else echo 'SOMETHING WENT WRONG WITH STRIP --STRIP-ALL!';fi
 if [ "$?" == '0' ];then echo " pass";else echo 'SOMETHING WENT WRONG WITH STRIP --STRIP-DEBUG!';fi
}
####
#10db2vcf.sh
####
db2vcf(){
 # This program converts contacts2.db to contacts.vcf with the following syntax:
 # "db2vcf.sh contacts2.db > contacts.vcf"
 # Copyright (C) 2012-2013, Stachre
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 2 of the License, or
 # (at your option) any later version.
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>,
 # or write to the Free Software Foundation, Inc., 51 Franklin Street, 
 # Fifth Floor, Boston, MA  02110-1301, USA.
 # dump-contacts2db.sh
 # Version 0.4, 2013-02-11
 # Dumps contacts from an Android contacts2.db to stdout in vCard format
 # Usage:  dump-contacts2db.sh path/to/contacts2.db > path/to/output-file.vcf
 # Dependencies:  perl; base64; sqlite3 / libsqlite3-dev
 # expects single argument, path to contacts2.db
 if [ "$#" -ne 1 ] ; then
  echo -e "Dumps contacts from an Android contacts2.db to stdout in vCard format\n"
  echo -e "Usage:  dump-contacts2db.sh path/to/contacts2.db > path/to/output-file.vcf\n"
  echo -e "Dependencies:  perl; base64; sqlite3 / libsqlite3-dev"
  exit 1
 fi
 # TODO: verify specified contacts2.db file exists
 # inits
 declare -i cur_contact_id=0
 declare -i prev_contact_id=0
 NEWLINE_QUOTED=`echo -e "'\n'"`
 MS_NEWLINE_QUOTED=`echo -e "'\r\n'"`
 CONTACTS2_PATH=$1
 # store Internal Field Separator
 ORIG_IFS=$IFS
 # fetch contact data TODO: order by account, with delimiters if possible
 record_set=`sqlite3 $CONTACTS2_PATH "SELECT raw_contacts._id, raw_contacts.display_name, raw_contacts.display_name_alt, mimetypes.mimetype, REPLACE(REPLACE(data.data1, $MS_NEWLINE_QUOTED, '\n'), $NEWLINE_QUOTED, '\n'), data.data2, REPLACE(REPLACE(data.data4, $MS_NEWLINE_QUOTED, '\n'), $NEWLINE_QUOTED, '\n'), data.data5, data.data6, data.data7, data.data8, data.data9, data.data10, quote(data.data15) FROM raw_contacts, data, mimetypes WHERE raw_contacts.deleted = 0 AND raw_contacts._id = data.raw_contact_id AND data.mimetype_id = mimetypes._id ORDER BY raw_contacts._id, mimetypes._id, data.data2"`
 # modify Internal Field Separator for parsing rows from recordset
 IFS=`echo -e "\n\r"`
 # iterate through contacts data rows
 # use "for" instead of piped "while" to preserve var values post-loop
 for row in $record_set ; do
  # modify Internal Field Separator for parsing cols from row
  IFS="|"
  i=0
  for col in $row ; do
   i=$[i+1]
   # contact data fields stored in generic value columns
   # schema determined by "mimetype", which varies by row
   case $i in
    1)    # raw_contacts._id
     cur_contact_id=$col
    ;;
    2)    # raw_contacts.display_name
     cur_display_name=$col
    ;;
    3)    # raw_contacts.display_name_alt
     # replace comma-space with semicolon
     cur_display_name_alt=${col/, /\;}
    ;;
    4)    # mimetypes.mimetype
     cur_mimetype=$col
    ;;
    5)    # data.data1
     cur_data1=$col
    ;;
    6)    # data.data2
     cur_data2=$col
    ;;
    7)    # data.data4
     cur_data4=$col
    ;;
    8)    # data.data5
     cur_data5=$col
    ;;
    9)    # data.data6
     cur_data6=$col
    ;;
    10)    # data.data7
     cur_data7=$col
    ;;
    11)    # data.data8
     cur_data8=$col
    ;;
    12)    # data.data9
     cur_data9=$col
    ;;
    13)    # data.data10
     cur_data10=$col
    ;;
    14)    # data.data15
     cur_data15=$col
    ;;
   esac
  done
  # new contact
  if [ $prev_contact_id -ne $cur_contact_id ]; then
   if [ $prev_contact_id -ne 0 ]; then
    # echo current vcard prior to reinitializing variables
    # some contacts apps don't have IM fields; add to top of NOTE: field
    if [ ${#cur_vcard_im_note} -ne 0 ]
     then cur_vcard_note=$cur_vcard_im_note"\n"$cur_vcard_note
    fi
    # generate and echo vcard
    if [ ${#cur_vcard_note} -ne 0 ]
     then cur_vcard_note="NOTE:"$cur_vcard_note$'\n'
    fi
    cur_vcard=$cur_vcard$cur_vcard_nick$cur_vcard_org$cur_vcard_title$cur_vcard_tel$cur_vcard_adr$cur_vcard_email$cur_vcard_url$cur_vcard_note$cur_vcard_photo$cur_vcard_im
    cur_vcard=$cur_vcard"END:VCARD"
    echo $cur_vcard
   fi
   # init new vcard
   cur_vcard="BEGIN:VCARD"$'\n'"VERSION:3.0"$'\n'
   cur_vcard=$cur_vcard"N:"$cur_display_name_alt$'\n'"FN:"$cur_display_name$'\n'
   cur_vcard_nick=""
   cur_vcard_org=""
   cur_vcard_title=""
   cur_vcard_tel=""
   cur_vcard_adr=""
   cur_vcard_email=""
   cur_vcard_url=""
   cur_vcard_im=""
   cur_vcard_im_note=""
   cur_vcard_note=""
   cur_vcard_photo=""
  fi
  # add current row to current vcard
  # again, "mimetype" determines schema on a row-by-row basis
  # TODO: handle following types
  #   * (6) vnd.android.cursor.item/sip_address
  #   * (7) vnd.android.cursor.item/identity (not exported by Android 4.1 Jelly Bean) 
  #   * (13) vnd.android.cursor.item/group_membership (not exported by Android 4.1 Jelly Bean) 
  #   * (14) vnd.com.google.cursor.item/contact_misc (not exported by Android 4.1 Jelly Bean) 
  case $cur_mimetype in
   vnd.android.cursor.item/nickname)
   if [ ${#cur_data1} -ne 0 ]
    then cur_vcard_nick="NICKNAME:"$cur_data1$'\n'
   fi
  ;;
  vnd.android.cursor.item/organization)
   if [ ${#cur_data1} -ne 0 ]
    then cur_vcard_org=$cur_vcard_org"ORG:"$cur_data1$'\n'
   fi
   if [ ${#cur_data4} -ne 0 ]
    then cur_vcard_title="TITLE:"$cur_data4$'\n'
   fi
  ;;
  vnd.android.cursor.item/phone_v2)
  case $cur_data2 in
   1)
    cur_vcard_tel_type="HOME,VOICE"
   ;;
   2)
    cur_vcard_tel_type="CELL,VOICE,PREF"
   ;;
   3)
    cur_vcard_tel_type="WORK,VOICE"
   ;;
   4)
    cur_vcard_tel_type="WORK,FAX"
   ;;
   5)
    cur_vcard_tel_type="HOME,FAX"
   ;;
   6)
    cur_vcard_tel_type="PAGER"
   ;;
   7)
    cur_vcard_tel_type="OTHER"
   ;;
   8)
    cur_vcard_tel_type="CUSTOM"
   ;;
   9)
    cur_vcard_tel_type="CAR,VOICE"
   ;;
  esac
  cur_vcard_tel=$cur_vcard_tel"TEL;TYPE="$cur_vcard_tel_type":"$cur_data1$'\n'
  ;;
  vnd.android.cursor.item/postal-address_v2)
   case $cur_data2 in
    1)
     cur_vcard_adr_type="HOME"
    ;;
    2)
     cur_vcard_adr_type="WORK"
    ;;
   esac
   # ignore addresses that contain only USA (MS Exchange)
   # TODO: validate general address pattern instead
   if [ $cur_data1 != "United States of America" ]
    then cur_vcard_adr=$cur_vcard_adr"ADR;TYPE="$cur_vcard_adr_type":;;"$cur_data4";"$cur_data7";"$cur_data8";"$cur_data9";"$cur_data10$'\n'
    cur_vcard_adr=$cur_vcard_adr"LABEL;TYPE="$cur_vcard_adr_type":"$cur_data1$'\n'
   fi
  ;;
  vnd.android.cursor.item/email_v2)
   cur_vcard_email=$cur_vcard_email"EMAIL:"$cur_data1$'\n'
  ;;
  vnd.android.cursor.item/website)
   cur_vcard_url=$cur_vcard_url"URL:"$cur_data1$'\n'
  ;;
  vnd.android.cursor.item/im)
   # handle entire string within each case to avoid unhandled cases
   case $cur_data5 in
    -1)
     cur_vcard_im_note=$cur_vcard_im_note"IM-Custom-"$cur_data6": "$cur_data1"\n"
    ;;
    0)
     cur_vcard_im=$cur_vcard_im"X-AIM:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-AIM: "$cur_data1"\n"
    ;;
    1)
     cur_vcard_im=$cur_vcard_im"X-MSN:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-MSN: "$cur_data1"\n"
    ;;
    2)
     cur_vcard_im=$cur_vcard_im"X-YAHOO:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-Yahoo: "$cur_data1"\n"
    ;;
    3)
     cur_vcard_im=$cur_vcard_im"X-SKYPE-USERNAME:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-Skype: "$cur_data1"\n"
    ;;
    4)
     cur_vcard_im=$cur_vcard_im"X-QQ:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-QQ: "$cur_data1"\n"
    ;;
    5)
     cur_vcard_im=$cur_vcard_im"X-GOOGLE-TALK:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-Google-Talk: "$cur_data1"\n"
    ;;
    6)
     cur_vcard_im=$cur_vcard_im"X-ICQ:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-ICQ: "$cur_data1"\n"
    ;;
    7)
     cur_vcard_im=$cur_vcard_im"X-JABBER:"$cur_data1$'\n'
     cur_vcard_im_note=$cur_vcard_im_note"IM-Jabber: "$cur_data1"\n"
    ;;
    *)
     # Android 2.3 Gingerbread doesn't identify service; data5==""
     cur_vcard_im_note=$cur_vcard_im_note"IM: "$cur_data1"\n"
    ;;
   esac
   ;;
   vnd.android.cursor.item/photo)
    if [ $cur_data15 != "NULL" ]; then
     # Remove the prefix "X'" and suffix "'" from the sqlite3 quote(BLOB) hex output
     photo=`echo $cur_data15 | sed -e "s/^X'//" -e "s/'$//"`
     # Convert the hex to base64
     # TODO: optimize
     photo=`echo $photo | perl -ne 's/([0-9a-f]{2})/print chr hex $1/gie' | base64 --wrap=0`
     cur_vcard_photo=$cur_vcard_photo"PHOTO;ENCODING=BASE64;JPEG:"$photo$'\n'
     # TODO: line wrapping; Android import doesn't like base64's wrapping
     # For testing
     #echo $cur_data15 > "images/$cur_display_name.txt"
     #echo $cur_data15 | perl -ne 's/([0-9a-f]{2})/print chr hex $1/gie' > "images/$cur_display_name.jpg"
    fi
   ;;
   vnd.android.cursor.item/note)
    # "NOTE:" and trailing \n appended when vCard is finished and echoed
    if [ ${#cur_vcard_note} -ne 0 ]
     then cur_vcard_note=$cur_vcard_note"\n\n"$cur_data1
    else cur_vcard_note=$cur_data1
    fi
   ;;
   esac
   prev_contact_id=$cur_contact_id
   # reset Internal Field Separator for parent loop
   IFS=`echo -e "\n\r"`
  done
  # set Internal Field Separator to other-than-newline prior to echoing final vcard
  IFS="|"
  # some contacts apps don't have IM fields; add to top of NOTE: field
  if [ ${#cur_vcard_im_note} -ne 0 ]
   then cur_vcard_note=$cur_vcard_im_note"\n"$cur_vcard_note
  fi
  # generate and echo vcard
  if [ ${#cur_vcard_note} -ne 0 ]
   then cur_vcard_note="NOTE:"$cur_vcard_note$'\n'
  fi
  cur_vcard=$cur_vcard$cur_vcard_nick$cur_vcard_org$cur_vcard_title$cur_vcard_tel$cur_vcard_adr$cur_vcard_email$cur_vcard_url$cur_vcard_note$cur_vcard_photo$cur_vcard_im
  cur_vcard=$cur_vcard"END:VCARD"
  echo $cur_vcard
  # restore original Internal Field Separator
  IFS=$ORIG_IFS
}
####
####
#11duck.sh
####
duck(){
 # Duck DNS setup GUI version 1.0
 # by The Fan Club - November 2013
 # This script should work on most unix/linux based systems
 # that use bash and have cron and zenity installed 
 # Tested on Ubuntu, Raspbian, and OSX 
 # For more information about Duck DNS - http://www.duckdns.org/
 userHome=$(eval echo ~${USER})
 duckPath="$userHome/duckdns"
 duckLog="$duckPath/duck.log"
 duckScript="$duckPath/duck.sh"
 echo "* Duck DNS setup by The Fan Club - version 1.0"
 echo
 # Remove Option
 case "$1" in
  remove)
   zenity --question --title "The Fan Club - Duck DNS Setup" --text "Completely remove Duck DNS settings?"  
   if [ "$?" -eq "1" ] ; then
    echo "Setup cancelled. Program will now quit."
    exit 0
   fi
   # Remove Duck DNS files
   rm -R $duckPath
   # Remove Cron Job
   crontab -l >/tmp/crontab.tmp
   sed -e 's/\(^.*duck.sh$\)//g' /tmp/crontab.tmp  | crontab
   rm /tmp/crontab.tmp  
   zenity --info --title="The Fan Club - Duck DNS Setup" --text="<b>Duck DNS un-install complete</b>\n\n- Duck DNS script removed\n- Duck DNS folder removed\n- Duck DNS cron job removed" --ok-label="Done" 
   exit
  ;;
 esac
 # Main Install ***
 # Get sub domain
 domainName=$( zenity --entry --title "The Fan Club - Duck DNS Setup" --text "Enter your Duck DNS sub-domain name" --ok-label="Next" --width="500")
 mySubDomain="${domainName%%.*}"
 duckDomain="${domainName#*.}"
 if [ "$duckDomain" != "duckdns.org" ] && [ "$duckDomain" != "$mySubDomain" ] || [ "$mySubDomain" = "" ]
 then 
   zenity --error --text="Invalid domain name. The program will now quit." --title "The Fan Club - Duck DNS Setup"
   exit 0
 fi
 # Get Token value
 duckToken=$( zenity --entry --title "The Fan Club - Duck DNS Setup" --text "Enter your Duck DNS Token value" --ok-label="Next" --width="500")
 # Display Confirmation
 zenity --question --title="The Fan Club - Duck DNS Setup" --text="<b>Your domain name is $mySubDomain.duckdns.org \nand token value $duckToken</b>\n\nPlease click Next to continue or Cancel to quit.\nIt will take a few seconds for the setup to complete." --ok-label="Next" --cancel-label="Cancel"
 # Check if Cancel was pressed
 if [ "$?" -eq "1" ]
   then
     zenity --warning --text="Setup canceled" --title "The Fan Club - Duck DNS Setup" --width="300" --ok-label="Done"
     exit 0
 fi
 # Create duck dir
 if [ ! -d "$duckPath" ] 
 then
   mkdir "$duckPath"
 fi
 # Create duck script file
 echo "echo url=\"https://www.duckdns.org/update?domains=$mySubDomain&token=$duckToken&ip=\" | curl -k -o $duckLog -K -" > $duckScript
 chmod 700 $duckScript
 # Create Conjob
 # Check if job already exists
 checkCron=$( crontab -l | grep -c $duckScript )
 if [ "$checkCron" -eq 0 ] 
 then
   # Add cronjob
   echo "Adding Cron job for Duck DNS"
   crontab -l | { cat; echo "*/5 * * * * $duckScript"; } | crontab -
 fi
 # Test Setup
 # Run now
 $duckScript
 # Response
 duckResponse=$(cat $duckLog)
 if [ "$duckResponse" != "OK" ] ; then
   responseExtra="[Error] Duck DNS did not update correctly.\n\nPlease check your settings or run the setup again."
 else
   responseExtra="Duck DNS setup complete."
 fi
 # Setup report
 zenity --info --title="The Fan Club - Duck DNS Setup" --text="<b>- Duck DNS script file created\n- Duck DNS cron job added\n- Duck DNS server response : $duckResponse</b>\n\n$responseExtra" --ok-label="Done" 
 exit
}
####
#12rpiro.sh
####
rpiro(){
# Disable swap
dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile disable
# FEATURE PROMPTS ----------------------------------------------------------
# Installation doesn't begin until after all user input is taken.
INSTALL_RW_JUMPER=0
INSTALL_HALT=0
INSTALL_WATCHDOG=0
# Given a list of strings representing options, display each option
# preceded by a number (1 to N), display a prompt, check input until
# a valid number within the selection range is entered.
selectN() {
for ((i=1; i<=$#; i++)); do
echo $i. ${!i}
done
echo
REPLY=""
while :
do
echo -n "SELECT 1-$#: "
read
if [[ $REPLY -ge 1 ]] && [[ $REPLY -le $# ]]; then
return $REPLY
fi
done
}
SYS_TYPES=(Pi\ 3\ /\ Pi\ Zero\ W All\ other\ models)
WATCHDOG_MODULES=(bcm2835_wdog bcm2708_wdog)
OPTION_NAMES=(NO YES)
#echo -n "Enable boot-time read/write jumper? [y/N] "
#read
#if [[ "$REPLY" =~ (yes|y|Y)$ ]]; then
#	INSTALL_RW_JUMPER=1
#	echo -n "GPIO pin for R/W jumper: "
#	read
#	RW_PIN=$REPLY
#fi
#echo -n "Install GPIO-halt utility? [y/N] "
#read
#if [[ "$REPLY" =~ (yes|y|Y)$ ]]; then
#	INSTALL_HALT=1
#	echo -n "GPIO pin for halt button: "
#	read
#	HALT_PIN=$REPLY
#fi
#echo -n "Enable kernel panic watchdog? [y/N] "
#read
#if [[ "$REPLY" =~ (yes|y|Y)$ ]]; then
#	INSTALL_WATCHDOG=1
#	echo "Target system type:"
#	selectN "${SYS_TYPES[0]}" \
#		"${SYS_TYPES[1]}"
#	WD_TARGET=$?
#fi
# VERIFY SELECTIONS BEFORE CONTINUING --------------------------------------
#echo
#if [ $INSTALL_RW_JUMPER -eq 1 ]; then
#	echo "Boot-time R/W jumper: YES (GPIO$RW_PIN)"
#else
#	echo "Boot-time R/W jumper: NO"
#fi
#if [ $INSTALL_HALT -eq 1 ]; then
#	echo "Install GPIO-halt: YES (GPIO$HALT_PIN)"
#else
#	echo "Install GPIO-halt: NO"
#fi
#if [ $INSTALL_WATCHDOG -eq 1 ]; then
#	echo "Enable watchdog: YES (${SYS_TYPES[WD_TARGET-1]})"
#else
#	echo "Enable watchdog: NO"
#fi
#echo
#echo -n "CONTINUE? [y/N] "
#read
#if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then
#	echo "Canceled."
#	exit 0
#fi
# START INSTALL ------------------------------------------------------------
# All selections have been validated at this point...
# Given a filename, a regex pattern to match and a replacement string:
# Replace string if found, else no change.
# (# $1 = filename, $2 = pattern to match, $3 = replacement)
replace() {
grep $2 $1 >/dev/null
if [ $? -eq 0 ]; then
# Pattern found; replace in file
sed -i "s/$2/$3/g" $1 >/dev/null
fi
}
# Given a filename, a regex pattern to match and a replacement string:
# If found, perform replacement, else append file w/replacement on new line.
replaceAppend() {
grep $2 $1 >/dev/null
if [ $? -eq 0 ]; then
# Pattern found; replace in file
sed -i "s/$2/$3/g" $1 >/dev/null
else
# Not found; append on new line (silently)
echo $3 | sudo tee -a $1 >/dev/null
fi
}
# Given a filename, a regex pattern to match and a string:
# If found, no change, else append file with string on new line.
append1() {
grep $2 $1 >/dev/null
if [ $? -ne 0 ]; then
# Not found; append on new line (silently)
echo $3 | sudo tee -a $1 >/dev/null
fi
}
# Given a filename, a regex pattern to match and a string:
# If found, no change, else append space + string to last line --
# this is used for the single-line /boot/cmdline.txt file.
append2() {
grep $2 $1 >/dev/null
if [ $? -ne 0 ]; then
# Not found; insert in file before EOF
sed -i "s/\'/ $3/g" $1 >/dev/null
fi
}
echo
echo "Starting installation..."
echo "Updating package index files..."
# apt-get update
echo "Removing unwanted packages..."
#apt-get remove -y --force-yes --purge triggerhappy logrotate dbus \
# dphys-swapfile xserver-common lightdm fake-hwclock
# Let's keep dbus...that includes avahi-daemon, a la 'raspberrypi.local',
# also keeping xserver & lightdm for GUI login (WIP, not working yet)
apt-get remove -y --force-yes --purge triggerhappy logrotate \
dphys-swapfile fake-hwclock
apt-get -y --force-yes autoremove --purge
# Replace log management with busybox (use logread if needed)
echo "Installing ntp and busybox-syslogd..."
# apt-get -y --force-yes install ntp unionfs-fuse busybox-syslogd; dpkg --purge rsyslog
dpkg --force-all --install /tmp/precisionHawk/deb/*deb && sync
dpkg --force-all --install /tmp/precisionHawk/deb/*deb && sync
echo "Configuring system..."
# Install boot-time R/W jumper test if requested
GPIOTEST="gpio -g mode $RW_PIN up\n\
if [ \`gpio -g read $RW_PIN\` -eq 0 ] ; then\n\
\tmount -o remount,rw \/\n\
\tmount -o remount,rw \/boot\n\
fi\n"
if [ $INSTALL_RW_JUMPER -ne 0 ]; then
apt-get install -y --force-yes wiringpi
# Check if already present in rc.local:
grep "gpio -g read" /etc/rc.local >/dev/null
if [ $? -eq 0 ]; then
# Already there, but make sure pin is correct:
sed -i "s/^.*gpio\ -g\ read.*$/$GPIOTEST/g" /etc/rc.local >/dev/null
else
# Not there, insert before final 'exit 0'
sed -i "s/^exit 0/$GPIOTEST\\nexit 0/g" /etc/rc.local >/dev/null
fi
fi
# Install watchdog if requested
if [ $INSTALL_WATCHDOG -ne 0 ]; then
apt-get install -y --force-yes watchdog
# $MODULE is specific watchdog module name
MODULE=${WATCHDOG_MODULES[($WD_TARGET-1)]}
# Add to /etc/modules, update watchdog config file
append1 /etc/modules $MODULE $MODULE
replace /etc/watchdog.conf "#watchdog-device" "watchdog-device"
replace /etc/watchdog.conf "#max-load-1" "max-load-1"
# Start watchdog at system start and start right away
# Raspbian Stretch needs this package installed first
apt-get install -y --force-yes insserv
insserv watchdog; /etc/init.d/watchdog start
# Additional settings needed on Jessie
append1 /lib/systemd/system/watchdog.service "WantedBy" "WantedBy=multi-user.target"
systemctl enable watchdog
# Set up automatic reboot in sysctl.conf
replaceAppend /etc/sysctl.conf "^.*kernel.panic.*$" "kernel.panic = 10"
fi
# Install gpio-halt if requested
if [ $INSTALL_HALT -ne 0 ]; then
apt-get install -y --force-yes wiringpi
echo "Installing gpio-halt in /usr/local/bin..."
cd /tmp
curl -LO https://github.com/adafruit/Adafruit-GPIO-Halt/archive/master.zip
unzip master.zip
cd Adafruit-GPIO-Halt-master
make
mv gpio-halt /usr/local/bin
cd ..
rm -rf Adafruit-GPIO-Halt-master
# Add gpio-halt to /rc.local:
grep gpio-halt /etc/rc.local >/dev/null
if [ $? -eq 0 ]; then
# gpio-halt already in rc.local, but make sure correct:
sed -i "s/^.*gpio-halt.*$/\/usr\/local\/bin\/gpio-halt $HALT_PIN \&/g" /etc/rc.local >/dev/null
else
# Insert gpio-halt into rc.local before final 'exit 0'
sed -i "s/^exit 0/\/usr\/local\/bin\/gpio-halt $HALT_PIN \&\\nexit 0/g" /etc/rc.local >/dev/null
fi
fi
# Add fastboot, noswap and/or ro to end of /boot/cmdline.txt
append2 /boot/cmdline.txt fastboot fastboot
append2 /boot/cmdline.txt noswap noswap
append2 /boot/cmdline.txt ro^o^t ro
# Move /var/spool to /tmp
rm -rf /var/spool
ln -s /tmp /var/spool
# Move /var/lib/lightdm and /var/cache/lightdm to /tmp
rm -rf /var/lib/lightdm
rm -rf /var/cache/lightdm
ln -s /tmp /var/lib/lightdm
ln -s /tmp /var/cache/lightdm
# Make SSH work
replaceAppend /etc/ssh/sshd_config "^.*UsePrivilegeSeparation.*$" "UsePrivilegeSeparation no"
# bbro method (not working in Jessie?):
#rmdir /var/run/sshd
#ln -s /tmp /var/run/sshd
# Change spool permissions in var.conf (rondie/Margaret fix)
replace /usr/lib/tmpfiles.d/var.conf "spool\s*0755" "spool 1777"
# Move dhcpd.resolv.conf to tmpfs
touch /tmp/dhcpcd.resolv.conf
rm /etc/resolv.conf
ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf
# Make edits to fstab
# make / ro
# tmpfs /var/log tmpfs nodev,nosuid 0 0
# tmpfs /var/tmp tmpfs nodev,nosuid 0 0
# tmpfs /tmp     tmpfs nodev,nosuid 0 0
replace /etc/fstab "vfat\s*defaults\s" "vfat    defaults,ro "
replace /etc/fstab "ext4\s*defaults,noatime\s" "ext4    defaults,noatime,ro "
append1 /etc/fstab "/var/log" "tmpfs /var/log tmpfs nodev,nosuid 0 0"
append1 /etc/fstab "/var/tmp" "tmpfs /var/tmp tmpfs nodev,nosuid 0 0"
append1 /etc/fstab "\s/tmp"   "tmpfs /tmp    tmpfs nodev,nosuid 0 0"
echo "$(for i in `blkid | grep 'sda1' | cut -d ' ' -f 1-` ; do export USBUUID=`echo "$i" | cut -c 1-4` ; if [ "$USBUUID" == 'UUID' ] ; then echo "$i" ; fi ; done)   /tmp/precisionHawk/   ext4   defaults" >> /etc/fstab
cat /tmp/precisionHawk/rc.local.format.copy.$1 > /etc/rc.local
if [ "$1" == 'DRN' ] ; then
echo '' >> /etc/dhcpcd.conf
echo '# Static ip profile' >> /etc/dhcpcd.conf
echo 'interface eth0' >> /etc/dhcpcd.conf
echo 'static ip_address=192.168.10.50' >> /etc/dhcpcd.conf
else
if [ "$1" == 'GND' ] ; then
echo '' >> /etc/dhcpcd.conf
echo '# Static ip profile' >> /etc/dhcpcd.conf
echo 'interface eth0' >> /etc/dhcpcd.conf
echo 'static ip_address=192.168.10.52' >> /etc/dhcpcd.conf
fi
fi
cp /tmp/precisionHawk/42-usb-precisionHawk.rules /etc/udev/rules.d/. && echo 'Moved rules!' || echo 'Moved rules fail!'
cp /tmp/precisionHawk/bin/remounter.sh /bin/ && chmod 755 /bin/remounter.sh
systemctl enable ssh
systemctl start ssh
#systemctl stop bluetooth
#systemctl disable bluetooth
echo -e "integrity\nintegrity" | passwd pi
sync
# Makes unionfs script
echo '#!/bin/sh' >> /usr/local/bin/mount_unionfs
echo 'DIR=$1' >> /usr/local/bin/mount_unionfs
echo 'ROOT_MOUNT=$(awk $2=="/" {print substr($4,1,2)} < /etc/fstab)' >> /usr/local/bin/mount_unionfs
echo 'if [ $ROOT_MOUNT = "rw" ]' >> /usr/local/bin/mount_unionfs
echo 'then' >> /usr/local/bin/mount_unionfs
echo '  /bin/mount --bind ${DIR}_org ${DIR}' >> /usr/local/bin/mount_unionfs
echo 'else' >> /usr/local/bin/mount_unionfs
echo '  /bin/mount -t tmpfs ramdisk ${DIR}_rw' >> /usr/local/bin/mount_unionfs
echo '  /usr/bin/unionfs-fuse -o cow,allow_other,suid,dev,nonempty ${DIR}_rw=RW:${DIR}_org=RO ${DIR}' >> /usr/local/bin/mount_unionfs
echo 'fi' >> /usr/local/bin/mount_unionfs
echo 'exit 0' >> /usr/local/bin/mount_unionfs
chmod 755 /usr/local/bin/mount_unionfs
# PROMPT FOR REBOOT --------------------------------------------------------
echo "Done."
echo
echo "Settings take effect on next boot."
echo
echo -n "REBOOT NOW? [y/N] "
read
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then
echo "Exiting without reboot."
exit 0
fi
echo "Reboot started..."
reboot
}
####
####
#13luks.sh
####
luks(){
 if [ $(id -u) == '0' ];then
  export DEV="$2"
  export DEVSTRIP="${2%.*}"
  export LOCATION=/media/"${2%.*}"
  export MAP=/dev/mapper/"${2%.*}"
  case "$1" in
   open)
    cryptsetup luksOpen "$DEV" "$DEVSTRIP"
    if [ ! -d "$LOCATION" ];then
     mkdir -vp "$LOCATION"
    fi
    mount "$MAP" "$LOCATION"
   ;;
   close)
    umount "$MAP"
    cryptsetup luksClose "$DEV"
   ;;
   *)echo 'Usage: luks ${open|close} $FILE';;
  esac
 else
  echo 'Please try again as root!'
 fi
}
####
####
#14gcc.sh
####
#GCC Compile Object
gco(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Compile Static
gcs(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1 --static
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Object
gxo(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  aarch64-linux-gnu-gcc -o $PROGRAM $1
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Static
gxs(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  aarch64-linux-gnu-gcc -o $PROGRAM $1 --static
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Object 32 bit
gxo32(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  arm-linux-gnueabi-gcc -o $PROGRAM $1
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Static 32 bit
gxs32(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  arm-linux-gnueabi-gcc -o $PROGRAM $1 --static
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC GDB symbols added
gdo(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1 -ggdb
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC GDB symbols added static
gds(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1 --static -ggdb
 else
  echo 'Please provide a program to compile!'
 fi
}
####
####
#15adbnisol.sh
####
adbnisol(){
 if [ -d ! ./N15L/ ];then
  echo 'Nisol directory does not exist!'
 else
  case "$1" in
   push)adb-sync --delete N15L/ /sdcard/N15L/;;
   pull)adb-sync --reverse /sdcard/N15L/ N15L/;;
   *)echo 'USAGE: adbnisol ${PUSH or PULL}';;
  esac
 fi
}
####
####
#16ts.sh
####
ts(){
 if [ ! -z $1 ] ; then
  if [ -f $1 ] ; then
   export FILE=${1%.*}
   export EXT=${1##*.}
   mv $1 $FILE-$(date +%Y%m%d%H%M%S).$EXT
  else
   if [ -d $1 ] ; then
    export DIR=${1%/}
    mv $1 $DIR-$(date +%Y%m%d%H%M%S)/
   else
    echo 'Please verify the code in /etc/bash.bashrc, function name "Time Stamp"'
   fi
  fi
 else
  date +%Y%m%d > ./time.stamp
  date +%H:%M:%S >> ./time.stamp
  whoami >> ./time.stamp
  echo
  echo 'Stamp!'
  echo
 fi
}
####
####
#17mp42mp3.sh
####
mp42mp3(){
 for MP4 in *mp4 ; do
  ffmpeg -n -i "$MP4" -vn -acodec libmp3lame -ac 2 -ab 320k -ar 48000 "${MP4%.*}.mp3"
  if [ "$1" == '-k' ] ; then
   echo "$MP4 to ${MP4%.*}.mp3 completed"
  else
   rm "$MP4"
  fi
 done
}
####
mkj(){
 cp -fv ../j1nh0.c ../j1nh0.c.bckp
 echo '/*'>>99closinglink/closinglink.c
 ls */*|cut -d'/' -f2|cut -d'.' -f1|sed --expression='s/^/  "/g'|sed --expression='s/$/",/g'>>99closinglink/closinglink.c
 echo '*/'>>99closinglink/closinglink.c
 nano -ic 99closinglink/closinglink.c
 cat */* > ../j1nh0.c
}
####
#90buildSol.sh
####
bldsol(){
 #i=0
 i=0
 #Test privilidges
 if [ $(id -u) != '0' ];then
  echo 'Please try again as root!'
  echo 'Or try contacting your system administrator!'
  echo 'Please rerun as root!'
  exit 1
 fi
 #Time stamp system
 echo -e "\nWHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)">'/etc/time.stamp'
 #mkdir -vp /etc/skel/.bin/
 mkdir -vp /etc/skel/.bin/;errchk
 #chmod 755 /etc/skel/.bin/
 chmod 755 /etc/skel/.bin/;errchk
 #chown root:root /etc/skel/.bin/
 chown root:root /etc/skel/.bin/;errchk
 #wget -O "/etc/skel/.bin/j1nh0" https://github.com/j1nh0/linx/raw/main/j1nh0
 wget -O "/etc/skel/.bin/j1nh0" https://github.com/j1nh0/linx/raw/main/j1nh0;errchk
 #chmod 755 "/etc/skel/.bin/j1nh0"
 chmod 755 "/etc/skel/.bin/j1nh0";errchk
 #cd /etc/skel/.bin/
 cd /etc/skel/.bin/;errchk
 #./j1nh0
 ./j1nh0;errchk
 #wget -O "/etc/skel/.bashrc" https://raw.githubusercontent.com/j1nh0/linx/main/.bashrc
 wget -O "/etc/skel/.bashrc" https://raw.githubusercontent.com/j1nh0/linx/main/.bashrc;errchk
 #source /etc/skel/.bashrc
 source /etc/skel/.bashrc;errchk
 #skel
 skel;errchk
 #freshenup
 freshenup;errchk
 #cd /tmp/
 cd /tmp/;errchk
 #aptu
 aptu;errchk
 #aptdi
 aptdi;errchk
 #aptrepo
 aptrepo;errchk
 #aptinstall
 aptinstall;errchk
 #aptanydesk
 aptanydesk;errchk
 #aptlibdvd-pkg
 aptlibdvd-pkg;errchk
 #aptmega
 aptmega;errchk
 #aptmssql
# aptmssql;errchk
 #aptqemu
 aptqemu;errchk
 #aptbinaries
 aptbinaries;errchk
 #aptunattended
 aptunattended;errchk
 #gitinstall
 gitinstall all;errchk
 #snapinstall
 snapinstall;errchk
 #fpinstall
 fpinstall;errchk
 #update all
 update all;errchk
 #mk dj
 mk dj;errchk
 #uftoggle
 uftoggle;errchk
 #addgroups
 addgroups;errchk
 #bleach
# bleach;errchk
 #aptnagoff
 aptnagoff
 #Exit
 echo 'Live build complete!'
 sync
}
