#adbsd.sh
~/.bin/adbsd)
 for ADBSD in\
  'DCIM'\
  'Download'\
  'Pictures'\
 ;do
  if [ ! -d ./sdcard/ ];then mkdir -vp ./sdcard/;fi
  adb-sync --reverse /sdcard/"$ADBSD" ./sdcard/
  if [ "$?" == '0' ];then
   sync
   adb shell rm -rfv /sdcard/"$ADBSD"/*
  else
   echo "$ADBSD not found!"
  fi
 done
;;
