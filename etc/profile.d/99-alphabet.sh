#99-alphabet.sh
a(){
 export USAGE='USAGE: a ${SOME FILE/FOLDER}'
 if [ ! -z $1 ];then
  export ARG="$1"
  export TAR="$(realpath -s $1)-$(date +%Y%m%d).tgz"
  export SEVENZ="$TAR.7z"
  find "$1" -print0|sort -z|tar --use-compress-program=pigz -cvf "$TAR" --null --no-recursion -T -;errchk
  rm -rf "$ARG";errchk
  7z a "$SEVENZ" "$TAR";errchk
  rm -rf "$TAR";errchk
 else usage;fi
}
b(){
 export USAGE='USAGE: backup ${SOMEFILE || DIR}'
 case "$1" in
  usage)usage;;
  *)if [ ! -z $1 ];then cp -rf "$1" "${1##*/}.bckp";sync;else usage;fi;;
 esac
}
alias c='clear'
d(){
 if [ ! -z "$1" ] && [ ! -z "$2" ]; then
  if [ -e "$1" ]; then
   export BS=$(fdisk -l "$1" | grep 'Sector size' | cut -d '/' -f3 | cut -d ' ' -f2)
   export COUNT=$(fdisk -l "$1" | head -1 | cut -d ',' -f3 | cut -d ' ' -f2)
   dd if="$1" of="$2" bs=$BS count=$COUNT status=progress && sync
  else
     echo 'Please provide a valid INPUT!'
  fi
 else
  echo 'Please provide an INPUT and an OUTPUT for dd!'
 fi
}
e(){
 clear
 echo '################################'
 echo 'Battery percentage is: '
 echo
 echo $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d ' ' -f15-)
 echo '################################'
 echo 'RAM info:'
 echo
 free -h
 echo '################################'
 echo 'CPU info:'
 echo
 lscpu | grep -e 'CPU(s):' -e 'Thread(s):' -e 'Core(s):' -e 'Model name:' -e 'CPU max' -e 'L3 cache:' -e 'Socket(s):' | grep -v 'NUMA'
 echo '################################'
 echo 'Temps:'
 echo
 paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -t | sed 's/...$/^C/'
 echo '################################'
 ps -a
 echo '################################'
 df -h|grep -e media -e j1nh0 -e mnt -e iso -e ramdisk
 echo '################################'
 mpstat
 echo '################################'
 date
 echo '################################'
 sleep 1
}
f(){
 if [ ! -z $1 ]; then
  firefox "$1" &> /dev/null &
 else
  firefox &> /dev/null &
 fi
}
g(){
 export USAGE='USAGE: g #STANDALONE FOR GPARTED# ${ c(ompile) | x(cross compile) | d(ebug)} ${SOME C FILE}'
 export PROGRAM="${2%.*}"
 if [ ! -z $1 ];then
  case $1 in
   c)export FLAGS='--static';;
   d)export FLAGS='--static -ggdb';;
   x)export FLAGS='--static';;
   *)echo $USAGE;;
  esac
  if [ ! -z $2 ];then
   if [ "$1" == 'x' ];then
    aarch64-linux-gnu-gcc -o $PROGRAM $2 $FLAGS
   else gcc -o $PROGRAM $2 $FLAGS;fi
   if [ "$1" == 'c' ];then
    strip $PROGRAM
    strip --strip-all $PROGRAM
    strip --strip-debug $PROGRAM
   fi
  else echo $USAGE;fi
 else sudo gparted &> /dev/null & fi
}
alias h='cd $HOME'
alias ht='htop'
alias i='clear;tree --du -h'
alias j='sudo su -'
k(){
 while true;do
  for INT in $(seq 1 4);do
   case "$INT" in
    1)echo -e "\n<(^_^<)\n";;
    2)echo -e "\n\t^(^_^)^\n";;
    3)echo -e "\n\t\t(>^_^)>\n";;
    4)echo -e "\n\t^(^_^)^\n";;
   esac
   echo -e "\nWHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)"
   sleep .5
   clear
  done
 done
}
alias l='ls --color'
alias mo='mount'
alias mot='mount|column -t'
alias mots='mount|column -t|sort'
alias n='nano -ic'
o(){
 if [ ! -z $1 ] ; then
  export PACKAGE="${1%/}"
  export USAGE='\nUsage: o ${OBJECT} a/e/l/p/x\n\nPlease use:\n\ta\tto archive\n\te\tto extract WITHOUT directories\n\tl\tto list\n\tp\tto protect\n\tx\tto extract WITH directories\n'
  oremoved(){
   echo 'Object removed!'
  }
  case "$2" in
   a)
    7z a "$PACKAGE.7z" "$1"
    if [ "$?" == '0' ];then
     rm -rf "$1"
     echo 'Object removed!'
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   e)7z e "$PACKAGE";;
   l)7z l "$PACKAGE";;
   p)
    if [ -f "$PACKAGE.7z" ] ; then
     rm "$PACKAGE.7z"
     oremoved
    fi
    echo 'Creating new package!'
    7z a "$PACKAGE.7z" "$1" -p
    if [ "$?" == '0' ] ; then
     rm -rf "$1"
     oremoved
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   x)7z x "$PACKAGE"&&rm "$PACKAGE";echo 'Old package removed!';;
   *)usage;;
  esac
 else
  o help################################
 fi
}
alias p='poweroff'
alias q='echo "FILLER"'
alias r='reboot'
alias s='sync'
t(){
 export USAGE='USAGE: t ${FILE}'
 if [ ! -z $1 ];then
  export ARG="$1"
  export SEVENZ="$(realpath -s $ARG)-$(date +%Y%m%d).7z"
  7z -v48m a "$SEVENZ" "$ARG"
  if [ "$?" == '0' ];then rm -rf "$ARG";else kickchk;fi
 else usage;fi
}
alias u='sudo umount'
alias v='veracrypt&>/dev/null &'
wi(){
 if [ -d '$RECYCLE.BIN' ];then rm -rfv '$RECYCLE.BIN';fi #Clean recycle bin
 if [ -d 'System Volume Information' ];then rm -rfv 'System Volume Information';fi #Clean system volume information
 if [ -f 'rescuepe.log' ];then rm -rfv 'rescuepe.log';fi #Clean rescuepe log
 if [ -f 'pagefile.sys' ];then rm -rfv 'pagefile.sys';fi #Clean pagefile.sys
 if [ -f 'DumpStack.log.tmp' ];then rm -rfv 'DumpStack.log.tmp';fi #Clean dump stack
 if [ -d '.Trash-999' ];then sudo rm -rfv '.Trash-999';fi #Clean .Trash-999
 if [ -d '.Trash-1000' ];then sudo rm -rfv '.Trash-1000';fi #Clean .Trash-1000
}
alias x='echo "FILLER"'
y(){
 export USAGE='USAGE: y ${ a(ll) | c(hannel) | d(epth) | k(eep) | m(usic) | mk(make) }'
 ytdlp(){
  yt-dlp -ci -f mp4 --download-archive download-archive.txt -o "%(title)s-%(id)s.%(ext)s" -v $(cat ./target.txt)
 }
 case "$1" in
  a|all)if [ ! -z $2 ];then for DIR in $(ls -d */);do cd "$DIR";y "$2";cd ..;sync;done;else usage;fi;;
  c|channel)ytdlp;;
#########THIS NEEDS WORK########
  d|depth)for URL in $(cat target.txt);do yt-dlp -ci -f mp4 --download-archive download-archive.txt -o "%(title)s-%(id)s.%(ext)s" -v "$URL";done;;
################################
  k|keep)ytdlp;mp42mp3 -k;;
  m|music)ytdlp;mp42mp3;;
  mk|make)touch download-archive.txt target.txt;nano -ic target.txt;;
  *)echo "$USAGE";;
 esac
}
z(){
 if [ ! -z $1 ] ; then
  case "$1" in
   '-f'|'--full')
    echo '########'unattended-upgrades
    echo "Full zero initiated $2"
    echo '########'
    echo 'If this is correct, please hit enter; otherwise press CTRL+C!'
    echo '########'
    read NULLVAR
    dd if=/dev/zero of="$2" bs=512 status=progress
    sync
   ;;
   *)
    echo '########'
    for CYCLE in $(seq 1 7) ; do
     echo "Cycle $CYCLE"
     echo '--------'
     dd if=/dev/zero of="$1" bs=512 count=1 status=progress
     sync
     echo '########'
    done
   ;;
  esac
 else echo 'Please provide an item to zero!';fi
}
