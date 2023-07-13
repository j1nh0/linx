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
