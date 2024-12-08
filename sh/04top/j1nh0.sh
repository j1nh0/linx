#j1nh0.sh
#Environment declaration
shopt -s autocd
shopt -s expand_aliases
export NPROC=$(nproc --ignore=1)
#Usage
usage(){
 echo -e "$USAGE"
}
#Hashtag print
hashtag(){
 export USAGE='USAGE: hashtag ${NUMBER}'
 if [ ! -z $1 ];then for INT in $(seq 1 "$1");do echo -n '#';done;echo;else usage;fi
}
#Error check
errchk(){
 if [ "$?" != '0' ];then echo -e "\n$(hashtag 8)\nPrevious command: !!\n\nSOMETHING WENT WRONG!\n\n";usage;read NULLVAR;fi
}
#dpkg-reconfigure
dpkgreconf(){
 export USAGE='USAGE: dpkgrecof ${SOME DEB PACKAGE}'
 if [ ! -z $1 ];then sudo dpkg-reconfigure -f noninteractive -p critical "$1";else usage;fi
}
#Sudo apt
alias apt='ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends'
alias aptu='apt update'
alias apti='apt install "$@"'
alias aptc='apt -y clean'
alias aptac='apt -y autoclean'
alias aptar='apt -y autoremove'
alias aptf='apt install -f -y'
alias aptp='apt purge "$@"'
alias aptdi='for APTDI in update dist-upgrade full-upgrade upgrade;do apt "$APTDI";done'
#Begin case
case "$0" in
#j1nh0 case
~/.bin/j1nh0)echo -e "\nj1nh0\n";;
