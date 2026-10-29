#BLEACH
bleach(){
 export USAGE='USAGE: bleach ####AS ROOT####';
 for BLEACH in $(bleachbit --list-cleaners|grep -v 'free_disk_space'|grep -v 'memory');do bleachbit --clean --overwrite "$BLEACH";done;
};
#BYTEARRAY
bytearray(){
 export USAGE='USAGE: bytearray ${ SOME FILE }';
 if [ ! -z "$ARG1" ];then
  xxd -u -i -c256 "$ARG1"|\
  sed -e 's/ //g'|\
  sed -e 's/unsignedchar/static unsigned char /'|\
  sed -e 's/unsignedint/static unsigned int /g'>"$ARG1.$C"&&\
  echo "$MESSPASS"||echo "$MESSFAIL";
 else usage;fi;
}; 
#CATALOG
catalog(){
 export USAGE='USAGE: catalog ${ w(eblist) | y(outube) | t(ext2email) }';
 case "$ARG1" in
  w|web)for LIST in ${WEBLIST[@]};do echo $LIST;done|column -x;;
  y|youtube)for LIST in ${YOUTUBELIST[@]};do echo $LIST;done|column -x;;
  t|text2email)for LIST in ${TEXTLIST[@]};do echo $LIST;done;;
  *)usage;;
 esac;
};
#CHANGEMAC
changemac(){
 export USAGE='USAGE: changemac ${SOME NETWORK INTERFACE}';
 if [ ! -z "$ARG1" ];then
  sudo ip link set down "$ARG1"&&\
  sudo macchanger -m "$(mk mac)" "$ARG1"&&\
  sudo ip link set up "$ARG1"&&\
 else usage;fi;
};
#CHR
chr(){
 export USAGE='USAGE: chr ${ m(ount) | u(nmount) }';
 case "$1" in
  m|mount)for MOUNT in 'dev' 'dev/pts' 'dev/shm' 'sys' 'proc' 'run';do sudo mount -o bind "/$MOUNT" ./"$MOUNT";done;chroot .;;
  u|unmount)for UNMOUNT in 'run' 'proc' 'sys' 'dev/shm' 'dev/pts' 'dev';do sudo umount ./"$UNMOUNT";done;;
  *)usage;;
 esac;
};
#DPKGRECONF
dpkgrecof(){
 export USAGE='USAGE: dpkgrecof ${ SOME DEB PACKAGE }';
 if [ ! -z $ARG1 ];then sudo dpkg-reconfigure -f noninteractive -p critical "$ARG1";else usage;fi;
};
#DROP
drop(){
 export USAGE='USAGE: drop ${ e(verything) | h(dd) | m(em) }';
 case "$ARG1" in
  e|everything)for INT in $(seq 1 3);do echo "$INT"|sudo tee /proc/sys/vm/drop_caches;sync;done;;
  h|hdd)echo '2'|sudo tee /proc/sys/vm/drop_caches;sync;;
  m|mem)echo '1'|sudo tee /proc/sys/vm/drop_caches;sync;;
  *)usage;;
 esac;
};
#ENGINE
engine(){
 export USAGE='USAGE: engine ${SOME COMMAND ON REPEAT} ${INTERVAL IF NEEDED}';
 case "$ARG1" in
  usage)usage;;
  *)if [ ! -z "$ARG2" ];then while true;do "$ARG1";sleep "$ARG2";done
   else while true;do $1;sleep 1;done;fi;;
 esac;
};
#FB
fb(){
 export USAGE='USAGE: fb ${ c(urrentslot) | r(eboot) | s(tock) }';
 case "$ARG1" in
  c|currentslot)fastboot getvar current-slot;;
  r|reboot)
   export USAGE="USAGE: fb reboot ${ b(ootloader) | d(ownload) | r(ecovery) }";
   case "$ARG2" in
    b|bootloader)fastboot reboot bootloader;;
    d|download)fastboot reboot download;;
    r|recovery)fastboot reboot recovery;;
    u|usage)usage;;
    *)fastboot reboot;;
   esac;
  ;;
  s|stock)
   export USAGE="USAGE: fb stock ${ l(emonadep) | i(nstantnoodle) }";
   case "$ARG2" in
    l|lemonadep)for FLASH in ${LEMONADEP[@]};do fastboot flash --slot=all "$FLASH" "$FLASH.img";done;;
    i|instantnoodle)for FLASH in ${INSTANTNOODLE[@]};do fastboot flash --slot=all "$FLASH" "$FLASH.img";done;;
    *)usage;;
   esac;
  ;;
  *)usage;;
 esac;
};
#FP
fp(){
 export USAGE='USAGE: fp ${ fi(flatpak install) | i(nstall) | l(ist) | r(un) | u(pdate) }';
 case "$ARG1" in
  'fi')export USAGE='USAGE: fpfi ${FLATHUB FLATPAK PACKAGE}';
   if [ ! -z "$ARG2" ];then sudo flatpak install flathub "$ARG2";else usage;fi;
  ;;
  i|install)export USAGE='USAGE: fpi ${FLATPAK PACKAGE NAME}';
   if [ ! -z "$ARG2" ];then sudo flatpak install "$ARG2";else usage;fi;
  ;;
  l|list)flatpak list;;
  r|run)export USAGE='USAGE: fpr ${FLATPAK TO RUN}';
   if [ ! -z "$ARG2" ];then flatpak run "$ARG2";else usage;fi;
  ;;
  u|update)sudo flatpak update;;
  *)usage;;
 esac;
};
#GET
get(){
 export USAGE='USAGE: get ${ b(ios) | i(nfo) | p(ath) }';
 case "$ARG1" in
  b|bios)
   clear;for DMI in system-manufacturer system-product-name bios-release-date bios-version system-serial-number;do
    echo -en "$(echo $DMI|rev|cut -d'-' -f1|rev|tr [:lower:] [:upper:]):\n\t";
    echo -e "$(dmidecode -s $DMI)";echo;
   done|column -t;
  ;;
  i|info)
   for DMI in bios system baseboard chassis processor memory cache connector slot;do dmidecode --type "$DMI";done;
   for DMI in system-serial-number bios-version;do dmidecode -s "$DMI";done;
   lshw -class disk -class storage;date +%Y%m%s%H%M%S;
  ;;
  p|path)echo $PATH|tr ':' '\n';;
  *)usage;;
 esac
};
#GHOST
torghost(){
 export USAGE='USAGE: ghost ${ s(tart) | st(op) | sw(itch) | u(pdate) }';
 case "$1" in
  s|start)export FLAG='--start';;
  st|stop)export FLAG='--stop';;
  sw|switch)export FLAG='--switch';;
  u|update)export FLAG='--update';;
  *)usage;;
 esac;
 torghost.py "$FLAG";
};
#GLOBAL
global(){
 export USAGE='USAGE: ';
 if [ -f /$ETC/$SSH/$SSHDCONFIG.$D/50-cloud-init.conf ];then echo 'PasswordAuthentication no'>/$ETC/$SSH/sshd_config.d/50-cloud-init.conf;fi;
 if [ -f /$ETC/$SSH/$SSHCONFIG ];then sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /$ETC/$SSH/$SSHCONFIG;fi;
 if [ -f /$ETC/$SSH/$SSHDCONFIG ];then sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /$ETC/$SSH/$SSHDCONFIG;fi;
 if [ -f /$ETC/$GDM3/$CUSTOMCONF ];then sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /$ETC/$GDM3/$CUSTOMCONF;fi;
 if [ -f /$ETC/$FUSE.$CONF ];then sed -i 's/#user_allow_other/user_allow_other/g' /$ETC/$FUSE.$CONF;fi;
};
#IMP
imp(){
 export USAGE='USAGE: imp ${ p(ack) | u(npack) }';
 case "$1" in
  p|pack)
####THIS NEEDS WORK####
   for ISO in $(ls -d */);do
    sync
   done
####THIS NEEDS WORK####
  ;;
  u|unpack)
   for ISO in $(ls *.iso);do mkdir ${ISO%%.*}
    sudo mount "$ISO" "/mnt/"&&cp -ruv /mnt/* ./"${ISO%%.*}"&&sync&&sudo umount "/mnt/"&&rm -v "$ISO"
   done
  ;;
  *)usage;;
 esac
};
#J1NH0
j1nh0(){
 echo 'j1nh0';
};
#JADB
jadb(){
 USAGE='USAGE: jadb ${ contacts | d | i | k | nisol | pull | push | r | reb | s | sd | sh | side | ur }';
 case "$1" in
  d)adb devices;;
  s)adb start-server;;
  k)adb kill-server;;
  r)adb root;;
  ur)adb unroot;;
  sh)adb shell;;
  push)export USAGE='USAGE: jadb push ${FOLDER}';if [ ! -z $2 ];then adb-sync --delete "$2" /sdcard/"$2";else usage;fi;;
  pull)export USAGE='USAGE: jadb pull ${FOLDER}';if [ ! -z $2 ];then adb-sync --reverse /sdcard/"$2" "$2";else usage;fi;;
  side)export USAGE='USAGE: jadb side ${ PACKAGE }';if [ ! -z $2 ];then adb sideload "$2";else usage;fi;;
  reb)
   export USAGE='USAGE jadb reb ${ b(ootloader) | d(ownload) | r(ecovery) }';
   case "$2" in
    b)adb reboot bootloader;;
    d)adb reboot download;;
    r)adb reboot recovery;;
    usage)usage;;
    *)adb reboot;;
   esac;
  ;;
  contacts)
    adb start-server;sleep 5;adb root;
    adb pull /data/data/com.android.providers.contacts/databases/contacts2.db ./contacts2-$(date +%Y%m%d).db;
    db2vcf ./contacts2-$(date +%Y%m%d).db > Contacts-$(date +%Y%m%d).vcf;
    adb unroot;
  ;;
  *)usage;;
 esac;
};
#JMIR
jmir(){
 export USAGE='USAGE: mirror ${ i(so) | m(erge) | o(utline) | s(hip) | w(ebsite) | n(isol) } ${SOURCE} ${DEST}';
 case "$ARG1" in
  i|iso)rsync --recursive --whole-file --human-readable --verbose --update --delete /iso/ /j1nh0/;;
  m|merge)if [ ! -z $3 ];then rsync --recursive --whole-file --human-readable --verbose --update "$2" "$3";else usage;fi;;
  o|outline)if [ ! -z $2 ];then tree -dfi --noreport .|cut -c3-|xargs -I{} mkdir -vp "$2{}";else usage;fi;;
  s|ship)if [ ! -z $3 ];then rsync --recursive --whole-file --human-readable --verbose --update --remove-source-files "$ARG2" "$ARG3";else usage;fi;;
  w|website)if [ ! -z $2 ];then wget --random-wait -e robots=off --no-parent --page-requisites --mirror --convert-links --continue --recursive --user-agent='RIPPER PLUGIN' --show-progress "$2";else usage;fi;;
  usage)usage;;
  n|nisol)for NISOL in $(ls -d */);do mirror ~/"$NISOL" ./"$NISOL";done;;
  *)if [ ! -z $2 ];then rsync --recursive --whole-file --human-readable --verbose --update --delete "$1" "$2";else usage;fi;;
 esac;
};
#MODPROBEUSB
modprobeusb(){
 export USAGE='USAGE: modprobeusb #AS ROOT!#';
 if [ $(id -u) != '0' ];then usage;else
  modprobe --ignore-install usb_storage;
  modprobe uas;
 fi;
};
