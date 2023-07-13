####
#00environment.sh
####
#Kali
case $- in
 *i*);;
 *) return;;
esac
#History control
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10
HISTFILESIZE=20
#Window control
shopt -s checkwinsize
#Determine chroot
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
 debian_chroot=$(cat /etc/debian_chroot)
fi
#Color control
case "$TERM" in
 xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
 if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
 else
  color_prompt=
 fi
fi
if [ "$color_prompt" = yes ]; then
 VIRTUAL_ENV_DISABLE_PROMPT=1
 prompt_color='\[\033[;32m\]'
 info_color='\[\033[1;34m\]'
 prompt_symbol=' ♠ ♦ ♣ ♥  '
 if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
  prompt_color='\[\033[;94m\]'
  info_color='\[\033[1;31m\]'
  prompt_symbol=' ☥ '
 fi
 PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
#Terminal control
case "$TERM" in
 xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
 *);;
esac
#Handy aliases
if [ -x /usr/bin/dircolors ]; then
 test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
 alias ls='ls --color=auto'
 alias dir='dir --color=auto'
 alias vdir='vdir --color=auto'
 alias grep='grep --color=auto'
 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'
 alias diff='diff --color=auto'
 alias ip='ip --color=auto'
 export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
 export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
 export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
 export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
 export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
 export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
 export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi
#Colored GCC warnings
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#Source aliases
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
 elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
 fi
fi
####
