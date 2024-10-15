#modprobeusb.sh
~/.bin/modprobeusb)
 export USAGE='USAGE: modprobeusb #AS ROOT!#'
 if [ $(id -u) != '0' ];then usage;else
  modprobe --ignore-install usb_storage
  modprobe uas
 fi
;;
