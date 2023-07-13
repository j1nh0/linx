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
