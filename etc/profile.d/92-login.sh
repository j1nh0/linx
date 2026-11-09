#92-LOGIN.SH
#SHOPT CONFIGS
for SHOPT in "$CONFIGSHOPT";do echo "$SHOPT";shopt -s "$SHOPT";done;
#cd "$HOME";
cd "$HOME";
#SSH DAEMON SETUP AND CONTROL
eval $(ssh-agent -k)&>"$NULL";
eval $(ssh-agent -s);ssh-add -D;
#CUSTOM BIN OPTIONS
if [ -d /opt/mssql-tools/bin ];then PATH=$PATH:/opt/mssql-tools/bin;fi; #/opt/mssql-tools/bin
if [ -d "$HOME"/.local/bin ];then PATH=$PATH:$HOME/.local/bin;fi; #~/.local/bin
if [ -d "$HOME"/.linx/etc/skel/.bin/ ];then PATH=$PATH:$HOME/.linx/etc/skel/.bin/;fi; #$HOME/.linx/etc/skel/.bin
#FRESHEN UP LINX
freshenup(){ if [ -d "$HOME/.linx" ];then cd "$HOME/.linx";git fetch --all;git reset --hard "$ORIGINMAIN";git clean -fd;else echo "No dir $HOME/.linx!";fi;source "$HOME/.bashrc"; };
