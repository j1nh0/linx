#92-LOGIN.SH
cd "$HOME"; #CD $HOME
eval $(ssh-agent -k)&>"$NULL"; #KILL SSH-AGENT
eval $(ssh-agent -s);ssh-add -D; #START SSH-AGENT
for SHOPT in histappend checkwinsize autocd expand_aliases;do shopt -s "$SHOPT";done; #AUTO CONFIGS
if [ -d "$BINMSSQL" ];then PATH="$PATH":"$BINMSSQL";fi; #BINMSSQL
if [ -d "$HOME"/"$BINLOCAL" ];then PATH="$PATH":"$HOME"/"$BINLOCAL";fi; #BINLOCAL
if [ -d "$HOME"/"$BINLINX" ];then PATH="$PATH":"$HOME"/"$BINLINX";fi; #BINLINX
