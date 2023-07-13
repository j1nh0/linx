####
#13luks.sh
####
luks(){
 if [ $(id -u) == '0' ];then
  export DEV="$2"
  export DEVSTRIP="${2%.*}"
  export LOCATION=/media/"${2%.*}"
  export MAP=/dev/mapper/"${2%.*}"
  case "$1" in
   open)
    cryptsetup luksOpen "$DEV" "$DEVSTRIP"
    if [ ! -d "$LOCATION" ];then
     mkdir -vp "$LOCATION"
    fi
    mount "$MAP" "$LOCATION"
   ;;
   close)
    umount "$MAP"
    cryptsetup luksClose "$DEV"
   ;;
   *)echo 'Usage: luks ${open|close} $FILE';;
  esac
 else
  echo 'Please try again as root!'
 fi
}
####
