#92-LOGIN.SH
#SHOPT CONFIGS
for SHOPT in histappend checkwinsize autocd expand_aliases;do shopt -s "$SHOPT";done;
#cd "$HOME";
cd "$HOME";
#SSH DAEMON SETUP AND CONTROL
eval $(ssh-agent -k)&>/dev/null;
eval $(ssh-agent -s);ssh-add -D;
#CUSTOM BIN OPTIONS
if [ -d "$BINMSSQL" ];then PATH="$PATH":"$BINMSSQL";fi; #BINMSSQL
if [ -d "$HOME"/"$BINLOCAL" ];then PATH="$PATH":"$HOME"/"$BINLOCAL";fi; #BINLOCAL
if [ -d "$HOME"/"$BINLINX" ];then PATH="$PATH":"$HOME"/"$BINLINX";fi; #BINLINX
#FRESHEN UP LINX
freshenup(){
 if [ -d "$HOME/.linx" ];then
  cd "$HOME/.linx";
  git fetch --all;
  git reset --hard "$ORIGINMAIN";
  git clean -fd;
 else echo "No dir $HOME/.linx!";fi;
 echo 'source $HOME/.bashrc';
 source "$HOME/.bashrc";
}; #FRESHENUP
