#get.sh
~/.bin/get)
 export USAGE='USAGE: get ${b(ios)|i(nfo)|p(ath)}'
 case "$1" in
  b|bios)
   clear
   for DMI in system-manufacturer system-product-name bios-release-date bios-version system-serial-number;do
    echo -en "$(echo $DMI|rev|cut -d'-' -f1|rev|tr [:lower:] [:upper:]):\n\t"
    echo -e "$(sudo dmidecode -s $DMI)"
    echo
   done|column -t
  ;;
  i|info)
   sudo dmidecode --type bios
   sudo dmidecode --type system
   sudo dmidecode --type baseboard
   sudo dmidecode --type chassis
   sudo dmidecode --type processor
   sudo dmidecode --type memory
   sudo dmidecode --type cache
   sudo dmidecode --type connector
   sudo dmidecode --type slot
   sudo dmidecode -s system-serial-number
   sudo dmidecode -s bios-version
   sudo lshw -class disk -class storage
   date +%Y%m%s%H%M%S
  ;;
  p|path)echo $PATH|tr ':' '\n';;
  *)usage;;
 esac
;;
