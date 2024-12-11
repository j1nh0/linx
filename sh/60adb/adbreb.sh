#adbreb.sh
~/.bin/adbreb)
 export USAGE='USAGE adbreb ${ b(ootloader) | d(ownload) | r(ecovery) }'
 case "$1" in
  b)adb reboot bootloader;;
  d)adb reboot download;;
  r)adb reboot recovery;;
  usage)usage;;
  *)adb reboot;;
 esac
;;
