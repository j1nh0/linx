#!/bin/bash -
#KALI
case $- in *i*);;*)return;;esac;
#TEST
test -r ~/.dircolors&&eval "$(dircolors -b ~/.dircolors)"||eval "$(dircolors -b)"
#DETERMINE CHROOT
if [ -z "${debian_chroot:-}" ]&&[ -r /etc/debian_chroot ];then debian_chroot=$(cat /etc/debian_chroot);fi
#COLOR CONTROL
export LESS_TERMCAP_mb="$\E[1;31m"
export LESS_TERMCAP_md="$\E[1;36m"
export LESS_TERMCAP_me="$\E[0m"
export LESS_TERMCAP_se="$\E[0m"
export LESS_TERMCAP_so="$\E[01;33m"
export LESS_TERMCAP_ue="$\E[0m"
export LESS_TERMCAP_us="$\E[1;32m"
color_prompt=yes
force_color_prompt=yes
if [ -n "$force_color_prompt" ];then if [ -x /usr/bin/tput ]&&tput setaf 1>&/dev/null;then color_prompt=yes;else color_prompt=;fi;fi
if [ "$color_prompt" = yes ];then
 VIRTUAL_ENV_DISABLE_PROMPT=1
 prompt_color='\[\033[;32m\]'
 info_color='\[\033[1;34m\]'
 prompt_symbol=' ♠ ♦ ♣ ♥  '
 # Change prompt colors for root user
 if [ "$EUID" -eq 0 ];then prompt_color='\[\033[;94m\]';info_color='\[\033[1;31m\]';prompt_symbol=' ☥ ';fi
 PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
else PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ';fi
unset color_prompt force_color_prompt
#TERMINAL CONTROL
case "$TERM" in
 xterm*|rxvt*)PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
 *);;
esac
#SOURCE ALIASES
if [ -f ~/.bash_aliases ];then . ~/.bash_aliases;fi
if ! shopt -oq posix;then if [ -f /usr/share/bash-completion/bash_completion ];then . /usr/share/bash-completion/bash_completion;elif [ -f /etc/bash_completion ];then . /etc/bash_completion;fi;fi
#UPON LOGIN
shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s expand_aliases
#cd $HOME
cd $HOME
#/etc/skel/.bin
if [ -d /etc/skel/.bin/ ];then
 if [ ! -d ~/.bin ];then mkdir ~/.bin/;fi
 cp -Ru /etc/skel/.bin/* ~/.bin/
 if [ -d ~/.bin ];then PATH=$PATH:~/.bin;fi
fi
#/opt/mssql-tools/bin
if [ -d /opt/mssql-tools/bin ];then PATH=$PATH:/opt/mssql-tools/bin;fi
#~/.local/bin
if [ -d ~/.local/bin ];then PATH=$PATH:~/.local/bin;fi
