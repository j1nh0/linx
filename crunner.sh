#!/bin/bash -
if [ "$1" == 'update' ];then curl 'https://raw.githubusercontent.com/j1nh0/linx/main/crunner.sh'>'/bin/crunner.sh'&&chmod 755 '/bin/crunner.sh'&&chown root:root '/bin/crunner.sh';exit 0;fi
#ENVIRONMENT CONTROL
shopt -s expand_aliases
LICENSEPLATE="$(hostname|sha256sum|cut -c1-7|tr [:lower:] [:upper:])"
#FUNCTION DECLARATION
sshdeladdcd(){
 #USED BY FF9E64D | 101DC52
 eval $(ssh-agent)&&\
 ssh-add -D&&\
 ssh-add ~/.ssh/"$1".piv&&\
 cd ~/q/"$1"
}
gitreset(){
 #USED BY FF9E64D | 101DC52
 rm -rf ./.git/&&\
 git init&&\
 git branch -m main&&\
 git remote add origin "ssh://git@github.com/j1nh0/${PWD##*/}.git"&&\
 git add -A&&\
 git commit -m $(date +%Y%m%d%H%M%S)&&\
 git push -f -v origin main
}
#MAIN LOGIC
case "$LICENSEPLATE" in
 101DC52)
  #FLIPPER UPDATE
  sshdeladdcd 'flipperdevices'&&\
  gitreset
  #ROGUEMASTER UPDATE
  sshdeladdcd 'RogueMaster'&&\
  gitreset
 ;;
 73BB053|2A578CE)
  #FLIPPER UPDATE
  sshdeladdcd 'flipperdevices'&&\
  gitreset
  #ROGUEMASTER UPDATE
  sshdeladdcd 'RogueMaster'&&\
  gitreset
  #REPO UPDATE
  cd ~;curl 'https://raw.githubusercontent.com/j1nh0/j1nh0/main/consumables/buildme.sh'|bash
  if [ ! -d ~/gitc/ ];then mkdir -vp 'gitc/';fi
  for GITC in $(ls -d ./git/*);do\
   7z u -up1q0r2x1y2z1w2\
    -x'!*/*.git' -x'!*/*/*.git' -x'!*/*/*/*.git'\
    -x'!*/*/*/*/*.git' -x'!*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*.git'\
    -x'!*/*/*/*/*/*/*/*.git' -x'!*/*/*/*/*/*/*/*.git'\
    gitc/$(basename "${GITC#*/}").7z "$GITC"
    sync
  done
 ;;
 *)echo "$LICENSEPLATE not found!";;
esac
#MAIN EXIT
exit 0
