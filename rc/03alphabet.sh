####
#03alphabet.sh
####
a(){
 if [ ! -z $1 ];then
  export ARG="$1"
  export TAR="$(realpath -s "$1")-$(date +%Y%m%d).tgz"
  export SEVENZ="$(realpath -s "$1")-$(date +%Y%m%d).tgz.7z"
  find "$1" -print0|sort -z|tar --use-compress-program=pigz -cvf "$TAR" --null --no-recursion -T -
  if [ "$?" == '0' ];then
   rm -rf "$ARG"
   7z a "$SEVENZ" "$TAR"
   if [ "$?" == '0' ];then
    rm -rf "$TAR"
   else
    echo 'SOMETHING WENT WRONG AFTER 7Z!'
    read NULLVAR
   fi
  else
   echo 'SOMETHING WENT WRONG AFTER TAR!'
   read NULLVAR
  fi
 else
  echo 'USAGE: a ${SOME FILE/FOLDER}'
 fi
}
alias b='sudo mount -o bind'
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
alias g='gparted &> /dev/null &'
alias h='cd $HOME'
alias i='clear;tree --du -h'
alias j='sudo su -'
k(){
 while true;do
  for INT in $(seq 1 4);do
   if [ "$INT" == 1 ];then echo -e "\n<(^_^<)\n";else
   if [ "$INT" == 2 ];then echo -e "\n\t^(^_^)^\n";else
   if [ "$INT" == 3 ];then echo -e "\n\t\t(>^_^)>\n";else
   if [ "$INT" == 4 ];then echo -e "\n\t^(^_^)^\n"
   fi
   fi
   fi
   fi
   echo -e "\nWHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)"
   sleep .5
   clear
  done
 done
}
alias l='ls --color'
alias mo='sudo mount'
alias mot='sudo mount | column -t'
alias n='echo "FILLER!!!"'
o(){
 if [ ! -z $1 ] ; then
  export PACKAGE="${1%/}"
  case "$2" in
   a)
    7z a "$PACKAGE.7z" "$1"
    if [ "$?" == '0' ] ; then
     rm -rf "$1"
     echo 'Object removed!'
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   e)
    7z e "$PACKAGE"
   ;;
   l)
    7z l "$PACKAGE"
   ;;
   p)
    if [ -f "$PACKAGE.7z" ] ; then
     rm "$PACKAGE.7z"
     echo 'Old package removed!'
    fi
    echo 'Creating new package!'
    7z a "$PACKAGE.7z" "$1" -p
    if [ "$?" == '0' ] ; then
     rm -rf "$1"
     echo 'Object removed!'
    else
     echo 'SOMETHING WENT WRONG AFTER 7Z!'
     read NULLVAR
    fi
   ;;
   x)
    7z x "$PACKAGE"
    if [ "$?" == '0' ] ; then
     rm "$PACKAGE"
     echo 'Old package removed!'
    fi
   ;;
   *)
    echo -e "
Please use:
\ta\tto archive
\te\tto extract WITHOUT directories
\tl\tto list
\tp\tto protect
\tx\tto extract WITH directories

Usage: o OBJECT a/e/l/p/x
"
   ;;
  esac
 else
  o help
 fi
}
alias p='sudo poweroff'
alias q='echo "FILLER"'
alias r='sudo reboot'
alias s='sync'
alias t='mkdir -vp ./tmp/&&cd ./tmp'
alias u='sudo umount'
alias v='veracrypt &> /dev/null &'
wi(){
 #Clean recycle bin
 if [ -d '$RECYCLE.BIN' ];then rm -rf '$RECYCLE.BIN';fi
 #Clean system volume information
 if [ -d 'System Volume Information' ];then rm -rf 'System Volume Information';fi
 #Clean rescuepe log
 if [ -f 'rescuepe.log' ];then rm 'rescuepe.log';fi
 #Clean pagefile.sys
 if [ -f 'pagefile.sys' ];then rm 'pagefile.sys';fi
 #Clean dump stack
 if [ -f 'DumpStack.log.tmp' ];then rm 'DumpStack.log.tmp';fi
 #Clean .Trash-999
 if [ -d '.Trash-999' ];then sudo rm -rf '.Trash-999';fi
 #Clean .Trash-1000
 if [ -d '.Trash-1000' ];then sudo rm -rf '.Trash-1000';fi
}
alias x='echo "FILLER"'
y(){
 if [ "$1" == '-mk' ]; then
  > download-archive.txt
  > target.txt
  nano -ic target.txt
 else
  yt-dlp -ci -f mp4 --download-archive download-archive.txt -o "%(title)s-%(id)s.%(ext)s" -v $(cat ./target.txt)
  case "$1" in
   '-m') mp42mp3;;
   '-k') mp42mp3 -k;;
   *) echo 'Usage: y -{c|m|k|mk}';;
  esac
 fi
}
z(){
 if [ ! -z $1 ] ; then
  case "$1" in
   '-f'|'--full')
    echo '########'
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
 else
  echo 'Please provide an item to zero!'
 fi
}
####
