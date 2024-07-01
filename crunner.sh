#!/bin/bash -
#ENVIRONMENT CONTROL
shopt -s expand_aliases
LICENSEPLATE="$(hostname|sha256sum|cut -c1-7|tr [:lower:] [:upper:])"
#FUNCTION DECLARATION
sshdeladdcd(){
 eval $(ssh-agent)&&\
 ssh-add -D&&\
 ssh-add ~/.ssh/"$1".piv&&\
 cd ~/"$1"
}
gitreset(){
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
 FF9E64D)
  #MEGA-SYNC TREE
  mega-sync
  #FLIPPER UPDATE
  sshdeladdcd 'flipperdevices'&&\
  gitreset
  #ROGUEMASTER UPDATE
  sshdeladdcd 'RogueMaster'&&\
  gitreset
  #REPO UPDATE
  cd ~/nisol/
  curl 'https://raw.githubusercontent.com/j1nh0/j1nh0/main/consumables/buildme.sh'|bash
 ;;
 *)echo "$LICENSEPLATE not found!";;
esac
#MAIN EXIT
exit 0
