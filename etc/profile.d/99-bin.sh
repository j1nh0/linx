#/opt/mssql-tools/bin
if [ -d /opt/mssql-tools/bin ];then PATH=$PATH:/opt/mssql-tools/bin;fi
#~/.local/bin
if [ -d $HOME/.local/bin ];then PATH=$PATH:$HOME/.local/bin;fi
#$HOME/.linx/etc/skel/.bin
if [ -d $HOME/.linx/etc/skel/.bin/ ];then PATH=$PATH:$HOME/.linx/etc/skel/.bin/;fi
