####
#15adbnisol.sh
####
adbnisol(){
 if [ -d ! ./N15L/ ];then
  echo 'Nisol directory does not exist!'
 else
  case "$1" in
   push)adb-sync --delete N15L/ /sdcard/N15L/;;
   pull)adb-sync --reverse /sdcard/N15L/ N15L/;;
   *)echo 'USAGE: adbnisol ${PUSH or PULL}';;
  esac
 fi
}
####
