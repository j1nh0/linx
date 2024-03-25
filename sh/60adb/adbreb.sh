#adbreb.sh
~/.bin/adbreb)
 case "$1" in
  b)adb reboot bootloader;;
  d)adb reboot download;;
  r)adb reboot recovery;;
  *)adb reboot;;
 esac
;;
