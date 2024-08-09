#!/bin/bash -
#ENVIRONMENT CONTROL
shopt -s expand_aliases
LICENSEPLATE="$(hostname|sha256sum|cut -c1-7|tr [:lower:] [:upper:])"
#FUNCTION DECLARATION
sshdeladdcd(){
 #USED BY FF9E64D | 101DC52
 eval $(ssh-agent)&&\
 ssh-add -D&&\
 ssh-add ~/.ssh/"$1".piv&&\
 cd ~/nisol/q/"$1"
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
 *)echo "$LICENSEPLATE not found!";;
esac
#MAIN EXIT
exit 0
