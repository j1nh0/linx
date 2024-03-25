#j1nh0.sh
#Environment declaration
shopt -s autocd
shopt -s expand_aliases
#Usage
usage(){
 echo -e "$USAGE"
}
#Hashtag print
hashtag(){
 export USAGE='USAGE: hashtag ${NUMBER}'
 if [ ! -z $1 ];then
  for INT in $(seq 1 "$1");do echo -n '#';done
  echo
 else usage;fi
}
#Error check
errchk(){
 if [ "$?" != '0' ];then echo -e "\n$(hashtag 8)\nPrevious command: $0\n\nSOMETHING WENT WRONG!\n\n";usage;read NULLVAR;fi
}
#Sudo apt
alias apt='sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends'
alias aptu='sudo apt update'
alias apti='sudo apt install "$@"'
alias aptc='sudo apt -y clean'
alias aptac='sudo apt -y autoclean'
alias aptar='sudo apt -y autoremove'
alias aptf='sudo apt install -f -y'
alias aptp='sudo apt purge "$@"'
alias aptdi='for APTDI in update dist-upgrade full-upgrade upgrade;do apt "$APTDI";done'
#Begin case
case "$0" in
#j1nh0 case
~/.bin/j1nh0)echo -e "\nj1nh0\n";;
