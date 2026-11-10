#97-ALPHABET.SH
a(){ if [ ! -z "$1" ];then find "$1" -print0|sort -z|tar --use-compress-program=pigz -cvf "$(realpath -s $ARG1)"-"$DATE""$TIME"."$TGZ" --null --no-recursion -T -;else echo "$MESSARG";fi; }; #ARCHIVE
b(){ if [ ! -z "$1" ];then cp -rf "$1" "${ARG1##*/}"-"$DATE.$TIME.$BCKP";else echo "$MESSARG";fi; }; #BACKUP
alias c='clear' #CLEAR
d(){ if [ ! -z "$1" ]&&[ ! -z "$2" ];then if [ -e "$1" ];then dd if="$1" of="$2" bs="$(fdisk -l "$1"|grep 'Sector size'|cut -d'/' -f3|cut -d' ' -f2)" count="$(fdisk -l "$1"|head -1|cut -d',' -f3|cut -d' ' -f2)" status=progress&&sync;else echo "$MESSARG";fi;else echo "$MESSARG";fi; }; #DD
e(){ clear;
 echo "$INFORAM";free -h;
 echo "$INFOCPU";lscpu | grep -e'CPU(s):' -e'Thread(s):' -e'Core(s):' -e'Model name:' -e'CPU max' -e'L3 cache:' -e'Socket(s):'|grep -v'NUMA';
 echo "$INFOPROCESS";ps -a;
 echo "$INFODISK";df -h|grep -e'media' -e'j1nh0' -e'mnt' -e'iso' -e'ramdisk';
 echo "$INFOSTAT";mpstat;
 echo "$ECHONEWLINE";date;
}; #ESSENTIALS
f(){ firefox&>"$NULL"; }; #FIREFOX
g(){ export USAGE='USAGE: g #STANDALONE FOR GPARTED# ${ c(ompile) | x(compile) | d(ebug) | s(trip) } ${SOME C FILE}';
 if [ ! -z "$1" ]&&[ ! -z "$2" ];then
  case "$1" in
   c|compile)gcc -o "${2%.*}" "$2" "$FLAGGCX";;
   x|xcompile)aarch64-linux-gnu-gcc -o "${2%.*}" "$2" "$FLAGGCX";;
   d|debug)gcc -o "${2%.*}" "$2" "$FLAGGD";;
   s|strip)strip "${2%.*}";strip --strip-all "${2%.*}";strip --strip-debug "${2%.*}";;
   *)usage;;
  esac;
 else sudo gparted;fi;
}; #GPARTED LAUNCH AND GDB COMPILER OPTIONS
alias h="cd $HOME"; #CD HOME
alias ht='htop'; #HTOP
alias i='clear;tree --du -h'; #TREE OUTPUT
alias ih='clear;tree --du -ha'; #TREE ALL OUTPUT
alias il='clear;tree --du -hp'; #TREE PERMISSIONS OUTPUT
alias j='sudo su -'; #RTFM
k(){
 while true;do for INT in $(seq 1 4);do case "$INT" in
  1)echo "\n<(^_^<)\n";;
  2)echo "\n\t^(^_^)^\n";;
  3)echo "\n\t\t(>^_^)>\n";;
  4)echo "\n\t^(^_^)^\n";;
 esac;echo "$MESSKIRBY";sleep .5;clear;done;done;
}; #KIRBY THREAD HOLDER
alias l='ls --color'; #STANDARD LS
alias mo='mount'; #STANDARD MOUNT
alias mot='mount|column -t'; #MOUNT WITH COLUMN
alias mots='mount|column -t|sort'; #MOUNT WITH COLUMN AND SORT
alias n='nano -ic'; #STANDARD NANO
alias nn='nano -ic'; #STANDARD NANO
o(){ export USAGE='\nUsage: o ${OBJECT} a/e/l/p/x\n\nPlease use:\n\ta\tto archive\n\te\tto extract WITHOUT directories\n\tl\tto list\n\tp\tto protect\n\tx\tto extract WITH directories\n'
 if [ ! -z "$1" ];then
  export PACKAGE="${1%/}"
  case "$2" in
   a)7z a "$PACKAGE".7z "$1";if [ "$?" == "$ZERO" ];then rm -rf "$1";else echo "$MESSERRCHK";read NULLVAR;fi;;
   e)7z e "$PACKAGE";;
   l)7z l "$PACKAGE";;
   p)
    if [ -f "$PACKAGE.7z" ];then rm "$PACKAGE.7z";fi
    echo 'Creating new package!'
    7z a "$PACKAGE.7z" "$1" -p
    if [ "$?" == '0' ];then rm -rf "$1";else echo "$MESSERRCHK";read NULLVAR;fi;;
   x)7z x "$PACKAGE"&&rm "$PACKAGE";echo 'Old package removed!';;
   *)usage;;
  esac;
 else usage;fi;
}; #OBJECT
alias p='systemctl poweroff -i --force'; #STANDARD POWEROFF
alias q='echo "FILLER"'; #FILLER
alias r='systemctl reboot -i --force'; #STANDARD REBOOT
alias s='sync'; #STANDARD SYNC
t(){ export USAGE='USAGE: t ${ FILE }';
 if [ ! -z "$1" ];then
  export SEVENZ="$(realpath -s "$1")"-"$DATE.$TIME".7z;
  7z -v48m a "$SEVENZ" "$1";
  if [ "$?" == '0' ];then rm -rf "$1";else usage;fi;
 else usage;fi;
}; #TEAR SOME FILE
alias u='sudo umount'; #STANDARD UMOUNT
alias v='echo "FILLER"'; #FILLER
wi(){
 if [ -d '$RECYCLE.BIN' ];then rm -rfv '$RECYCLE.BIN';fi #CLEAN RECYCLE BIN
 if [ -d 'System Volume Information' ];then rm -rfv 'System Volume Information';fi #CLEAN SYSTEM VOLUME INFORMATION
 if [ -f 'rescuepe.log' ];then rm -rfv 'rescuepe.log';fi #CLEAN RESCUEPE LOG
 if [ -f 'pagefile.sys' ];then rm -rfv 'pagefile.sys';fi #CLEAN PAGEFILE.SYS
 if [ -f 'DumpStack.log.tmp' ];then rm -rfv 'DumpStack.log.tmp';fi #CLEAN DUMP STACK
 if [ -d '.Trash-999' ];then sudo rm -rfv '.Trash-999';fi #CLEAN .TRASH-999
 if [ -d '.Trash-1000' ];then sudo rm -rfv '.Trash-1000';fi #CLEAN .TRASH-1000
}; #WINDOWS AND TRASH CLEANER
alias x='echo "FILLER"'; #FILLER
y(){ export USAGE='USAGE: y ${ a(ll) | c(hannel) | k(eep) | m(usic) | mk(make) }';
 ytdlp(){ yt-dlp -ci -f "$MP4" --download-archive "$DOWNLOADARCHIVE.$TXT" -o '%(title)s-%(id)s.%(ext)s' -v "$(cat $TARGET.$TXT)"; }
 case "$1" in
  a|all)if [ ! -z "$2" ];then for DIR in $(ls -d */);do cd "$DIR";y "$2";cd ..;sync;done;else usage;fi;;
  c|channel)ytdlp;;
  k|keep)ytdlp;mp42mp3 -k;;
  m|music)ytdlp;mp42mp3;;
  mk|make)touch "$DOWNLOADARCHIVE.$TXT" "$TARGET.$TXT"&&nano -ic "$TARGET.$TXT";;
  *)usage;;
 esac;
}; #YTDLP
z(){
 if [ ! -z "$1" ] ; then
  case "$1" in
   '-f'|'--full')echo "$MESSZFULL";read NULLVAR;dd if=/dev/zero of="$2" bs=512 status=progress;sync;;
   *)for CYCLE in $(seq 1 7);do echo "Cycle $CYCLE\n--------\n";dd if=/dev/zero of="$1" bs=512 count=1 status=progress;sync;done;;
  esac;
 else echo "$MESSARG";fi;
}; #ZERO DISK
