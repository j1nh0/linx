#94-ALIAS.SH
#WORKER FUNCTIONS;
cd(){ builtin cd "$@"&&ls --color; }; #AUTO CD AND LIST
usage(){ echo "$USAGE"; }; #PRINT USAGE
errchk(){ if [ "$?" != '0' ];then echo "$MESSERRCHK";read NULLVAR;fi; }; #ERROR CHECK
hashtag(){ if [ ! -z "$ARG1" ];then for INT in $(seq 1 "$ARG1");do echo -n '#';done;echo;fi; }; #PRINT HASHTAG
freshenup(){
 if [ -d "$HOMELINX" ];then
  if [ -f "$KEYLINX" ];then
   ssh-add "$KEYLINX";
   cd "$HOMELINX";
   git fetch --all;
   git reset --hard "$ORIGINMAIN";
   git clean -fd;
   source "$HOMEBASHRC";
  else echo "No $KEYLINX!";fi;
 else echo 'No linx dir!';fi;
}; #FRESHENUP
#STANDARD CANTRIPS;
alias cp='cp -Rfv';
alias crontabe='crontab -e';
alias cub='cubic -v&>/dev/null &';
alias df='df -h';
alias dfs="df|grep 'Filesystem'&&df|grep -v 'Filesystem'|sort";
alias dfw='while true;do df -h;date;sleep 1;clear;done';
alias diff='diff --color=auto';
alias dir='dir --color=auto';
alias du='du -sh';
alias echo='echo -e';
alias egrep='egrep --color=auto';
alias fdl='fdisk -l';
alias fgrep='fgrep --color=auto';
alias free='free -h';
alias grep='grep --color';
alias grep='grep --color=auto';
alias hold='echo HOLDING&&read NULLVAR';
alias ip='ip --color=auto -a';
alias ipa='ip addr';
alias less='less -N';
alias ls='ls --color=auto';
alias mkb='mkdir -vp ./build/&&cd ./build/';
alias mkd="if [ ! -z $ARG1 ];then mkdir -vp $@;fi";
alias mkt='mkdir -vp ./tmp/&&cd ./tmp/';
alias mv='mv -v';
alias nano='nano -ic';
alias ping='ping -c4';
alias rr='rm -rf';
alias scp='scp -r';
alias ssh='ssh -X';
alias top='top -1';
alias vdir='vdir --color=auto';
#LISTING;
alias l1='ls -1 --color';
alias la='ls -a --color';
alias lb='lsblk';
alias lc='lscpu';
alias ld='ls -d */';
alias li='ls -i --color';
alias ll='ls -l1Ah --color';
alias lsd='ls -1 --color /dev/sd*';
alias lt='ls -1t --color';
alias lU='ls -1U --color';
alias lx='ls -x --color';
alias cl='clear;ls --color';
alias cl1='clear;sync;ls -h1 --color';
alias cla='clear;sync;ls -ha --color';
alias cll='clear;sync;ls -lh --color';
alias cls='clear;sync;ls -h --color';
alias clw='clear;sync;ls|wc -l';
alias clla='clear;sync;ls -lha --color';
#TRAVERSAL;
alias ..='cd ../';
alias ...='cd ../../';
alias ....='cd ../../../';
alias .....='cd ../../../../';
alias ......='cd ../../../../../';
alias .......='cd ../../../../../../';
alias ........='cd ../../../../../../../';
alias .........='cd ../../../../../../../../';
alias ..........='cd ../../../../../../../../../';
alias ...........='cd ../../../../../../../../../../';
alias ............='cd ../../../../../../../../../../../';
alias .............='cd ../../../../../../../../../../../../';
alias ..............='cd ../../../../../../../../../../../../../';
alias ...............='cd ../../../../../../../../../../../../../../';
