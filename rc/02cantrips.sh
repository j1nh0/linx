#Directory traversal
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
#Standard cantrips
alias df='df -h'
alias du='du -sh'
alias cp='cp -Rfv'
alias mv='mv -v'
alias nn='nano -ic'
alias rr='rm -r'
alias cub='cubic &> /dev/null &'
alias dfw='while true;do df -h;date;sleep 1;clear;done'
alias fdl='fdisk -l'
alias ipa='ip addr'
alias mkd='mkdir -vp'
alias mkt='mkdir -vp ./tmp/&&cd ./tmp/'
alias scp='scp -r'
alias ssh='ssh -X'
alias top='top -1'
alias free='free -h'
alias grep='grep --color'
alias hold='sleep 3600'
alias less='less -N'
alias nano='nano -ic'
alias ping='ping -c 4'
alias recdrom='sudo mount -o rw,remount,rw /cdrom'
#Listing
alias cl='clear;ls --color'
alias l1='ls -1 --color'
alias la='ls -a --color'
alias lb='lsblk'
alias lc='lscpu'
alias ld='ls -d */'
alias li='ls -i --color'
alias ll='ls -l1Ah --color'
alias lt='ls -1t --color'
alias lU='ls -1U --color'
alias lx='ls -x --color'
alias lsd='ls -1 --color /dev/sd*'
alias cla='clear;sync;ls -ha --color'
alias cll='clear;sync;ls -lh --color'
alias cls='clear;sync;ls -h --color'
alias wcl='ls|wc -l'
#Sudo apt
alias apt='sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends'
