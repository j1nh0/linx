#94-COMMANDS.SH
bleach(){ for BLEACH in $(bleachbit --list-cleaners|grep -v 'free_disk_space'|grep -v 'memory');do bleachbit --clean --overwrite "$BLEACH";done; }; #BLEACH
bootconfig(){ export USAGE='USAGE: bootconfig';
 echo "$GRUBCFG">"$GRUB.$CFG"
 echo "$LOOPBACKCFG">"$LOOPBACK.$CFG"
}; #BOOTCONFIG
bytearray(){ export USAGE='USAGE: bytearray ${ SOME FILE }';
 if [ ! -z "$1" ];then
  xxd -u -i -c256 "$1"|\
  sed -e 's/ //g'|\
  sed -e 's/unsignedchar/static unsigned char /'|\
  sed -e 's/unsignedint/static unsigned int /g'>"$1.$C"&&\
  echo "$MESSPASS"||echo "$MESSFAIL";
 else usage;fi;
}; #BYTEARRAY
catalog(){ export USAGE='USAGE: catalog ${ w(eblist) | y(outubelist) | t(ext2email) | l(emonadep) | i(nstantnoodle) | s(tallion) }';
 case "$1" in
  w|weblist)for LIST in ${WEBLIST[@]};do echo $LIST;done|column -x;;
  y|youtubelist)for LIST in ${YOUTUBELIST[@]};do echo $LIST;done|column -x;;
  t|text2email)for LIST in ${TEXT2EMAIL[@]};do echo $LIST;done;;
  l|lemonadep)for LIST in ${LEMONADEP[@]};do echo $LIST;done;;
  i|instantnoodle)for LIST in ${INSTANTNOODLE[@]};do echo $LIST;done;;
  s|stallion)for LIST in ${STALLION[@]};do echo $LIST;done;;
  *)usage;;
 esac;
}; #CATALOG
changemac(){ export USAGE='USAGE: changemac ${SOME NETWORK INTERFACE}';
 if [ ! -z "$1" ];then
  sudo ip link set down "$1"&&\
  sudo macchanger -m "$(mk mac)" "$1"&&\
  sudo ip link set up "$1";
 else usage;fi;
}; #CHANGEMAC
chr(){ export USAGE='USAGE: chr ${ m(ount) | u(nmount) }';
 case "$1" in
  m|mount)for MOUNT in 'dev' 'dev/pts' 'dev/shm' 'sys' 'proc' 'run';do sudo mount -o bind "/$MOUNT" ./"$MOUNT";done;chroot .;;
  u|unmount)for UNMOUNT in 'run' 'proc' 'sys' 'dev/shm' 'dev/pts' 'dev';do sudo umount ./"$UNMOUNT";done;;
  *)usage;;
 esac;
}; #CHR
dpkgrecof(){ export USAGE='USAGE: dpkgrecof ${ SOME DEB PACKAGE }';if [ ! -z "$1" ];then sudo dpkg-reconfigure -f noninteractive -p critical "$1";else usage;fi; }; #DPKGRECONF
drop(){ export USAGE='USAGE: drop ${ e(verything) | h(dd) | m(em) }';
 case "$1" in
  e|everything)for INT in $(seq 1 3);do echo "$INT"|sudo tee /proc/sys/vm/drop_caches;sync;done;;
  h|hdd)echo '2'|sudo tee /proc/sys/vm/drop_caches;sync;;
  m|mem)echo '1'|sudo tee /proc/sys/vm/drop_caches;sync;;
  *)usage;;
 esac;
}; #DROP
engine(){ export USAGE='USAGE: engine ${SOME COMMAND ON REPEAT} ${INTERVAL IF NEEDED}';
 case "$1" in
  usage)usage;;
  *)if [ ! -z "$2" ];then while true;do "$1";sleep "$2";done;else while true;do $1;sleep 1;done;fi;;
 esac;
}; #ENGINE
fb(){ export USAGE='USAGE: fb ${ c(urrentslot) | r(eboot) | s(tock) }';
 case "$1" in
  c|currentslot)fastboot getvar current-slot;;
  r|reboot)export USAGE='USAGE: fb reboot ${ b(ootloader) | d(ownload) | r(ecovery) }';
   case "$2" in
    b|bootloader)fastboot reboot bootloader;;
    d|download)fastboot reboot download;;
    r|recovery)fastboot reboot recovery;;
    u|usage)usage;;
    *)fastboot reboot;;
   esac;
  ;;
  s|stock)export USAGE='USAGE: fb stock ${ l(emonadep) | i(nstantnoodle) }';
   case "$2" in
    l|lemonadep)for FLASH in ${LEMONADEP[@]};do fastboot flash --slot=all "$FLASH" "$FLASH.img";done;;
    i|instantnoodle)for FLASH in ${INSTANTNOODLE[@]};do fastboot flash --slot=all "$FLASH" "$FLASH.img";done;;
    *)usage;;
   esac;
  ;;
  *)usage;;
 esac;
}; #FB
fp(){ export USAGE='USAGE: fp ${ f(lat)h(ub) | i(nstall) | l(ist) | r(un) | u(pdate) }';
 case "$1" in
  fh|flathub)export USAGE='USAGE: fpfi ${FLATHUB FLATPAK PACKAGE}';if [ ! -z "$2" ];then sudo flatpak install flathub "$2";else usage;fi;;
  i|install)export USAGE='USAGE: fpi ${FLATPAK PACKAGE NAME}';if [ ! -z "$2" ];then sudo flatpak install "$2";else usage;fi;;
  l|list)flatpak list;;
  r|run)export USAGE='USAGE: fpr ${FLATPAK TO RUN}';if [ ! -z "$2" ];then flatpak run "$2";else usage;fi;;
  u|update)sudo flatpak update;;
  *)usage;;
 esac;
}; #FP
get(){ export USAGE='USAGE: get ${ b(ios) | i(nfo) | p(ath) }';
 case "$1" in
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
}; #GET
torghost(){ export USAGE='USAGE: ghost ${ s(tart) | st(op) | sw(itch) | u(pdate) }';
 case "$1" in
  s|start)export FLAG='--start';;
  st|stop)export FLAG='--stop';;
  sw|switch)export FLAG='--switch';;
  u|update)export FLAG='--update';;
  *)usage;;
 esac;torghost.py "$FLAG";
}; #GHOST
global(){
 if [ -f /$ETC/$SSH/$SSHDCONFIG.$D/50-cloud-init.conf ];then echo 'PasswordAuthentication no'>/$ETC/$SSH/sshd_config.d/50-cloud-init.conf;fi;
 if [ -f /$ETC/$SSH/$SSHCONFIG ];then sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /$ETC/$SSH/$SSHCONFIG;fi;
 if [ -f /$ETC/$SSH/$SSHDCONFIG ];then sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /$ETC/$SSH/$SSHDCONFIG;fi;
 if [ -f /$ETC/$GDM3/$CUSTOMCONF ];then sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /$ETC/$GDM3/$CUSTOMCONF;fi;
 if [ -f /$ETC/$FUSE.$CONF ];then sed -i 's/#user_allow_other/user_allow_other/g' /$ETC/$FUSE.$CONF;fi;
}; #GLOBAL
j1nh0(){ echo 'j1nh0'; }; #J1NH0
jadb(){ USAGE='USAGE: jadb ${ contacts | d | i | k | nisol | pull | push | r | reb | s | sd | sh | side | ur }';
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
  reb)export USAGE='USAGE jadb reb ${ b(ootloader) | d(ownload) | r(ecovery) }';
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
}; #JADB
japt(){ export USAGE='USAGE: japt ${ r(epo) | i(nstall) | m(ega) | libdvd-pkg | v(isual)s(tudio) | lightdesktop }';
 case "$1" in
  r|repo)
   for APTREPO in\
    'deb http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse'\
    'deb http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse'\
    'deb http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse'\
    'deb http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse'\
    'deb http://archive.canonical.com/ubuntu/ jammy partner'\
    'ppa:cubic-wizard/release'\
    'ppa:unit193/encryption'\
   ;do if dig +short http://archive.ubuntu.com;then add-apt-repository -y "$APTREPO";fi;done;
   for APTREPO in 'universe' 'multiverse' 'restricted';do if dig +short http://archive.ubuntu.com;then add-apt-repository -y "$APTREPO";fi;done;
  ;;
  i|install)
   for APTBAREBONES in\
    'build-essential' 'bash' 'bc' 'binutils-aarch64-linux-gnu' 'binutils-arm-linux-gnueabi' 'bison' 'bleachbit' 'bzip2'\
    'ca-certificates' 'ccache' 'cifs-utils' 'cmake' 'cpio' 'crunch' 'cryptsetup' 'cubic' 'curl'\
    'deluge' 'dosfstools'\
    'efitools'\
    'ffmpeg' 'flatpak' 'flex'\
    'gcc-12' 'gcc-aarch64-linux-gnu' 'gcc-arm-linux-gnueabihf' 'gcc-mingw-w64-x86-64' 'ghostscript' 'git' 'git-core' 'git-lfs' 'gparted' 'gzip'\
    'htop'\
    'inxi'\
    'libelf-dev' 'libncurses-dev' 'libpam-pwquality' 'libreoffice' 'libssh-dev' 'libssl-dev' \
    'macchanger' 'make' 'mdadm' 'mokutil' 'mtools'\
    'net-tools' 'nmap'\
    'openssl'\
    'pigz' 'pip' 'p7zip-full'\
    'qrencode'\
    'rename'\
    'sbsigntool' 'screen' 'sed' 'shc' 'solaar' 'sqlite3' 'squashfs-tools' 'ssh' 'sshfs' 'syslinux-common' 'syslinux-efi'\
    'tpm2-tools' 'tree'\
    'veracrypt' 'vim' 'vlc'\
    'xclip'\
    'zip'\
   ;do if dig +short http://archive.ubuntu.com;then apt install "$APTBAREBONES";fi;done;
  ;;
  m|mega)wget https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megacmd-xUbuntu_24.04_amd64.deb&&apt-get install -y "$PWD/megacmd-xUbuntu_24.04_amd64.deb"&&rm -fv megacmd*;;
  libdvd-pkg)apt update;
   for APTLIBDVDPKG in\
    'libdvdcss-dev'\
    'libdvdread-dev'\
    'libdvdnav-dev'\
    'libdvd-pkg'\
   ;do DEBIAN_FRONTEND=noninteractive apt-get install -y "$APTLIBDVDPKG";done;dpkg-reconfigure libdvd-pkg;
  ;;
  vs|visualstudio)
   apt-get install -y wget gpg apt-transport-https;
   wget -qO- https://packages.microsoft.com/keys/microsoft.asc|gpg --dearmor>packages.microsoft.gpg;
   install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg;
   echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main"|tee /etc/apt/sources.list.d/vscode.list>/dev/null;
   rm -f packages.microsoft.gpg;
   apt update;apt install code;
  ;;
  lightdesktop)for FORAPTINSTALL in sudo xfce4 xfce4-terminal chromium lightdm htop;do if [ $(dpkg -l $FORAPTINSTALL) != '0' ];then apt install "$FORAPTINSTALL";fi;done;;
  *)usage;;
 esac;
}; #JAPT
jgit(){ export USAGE='USAGE: jgit ${ c | clean | commit | def | extra | origin | prune | push | rmhist }';
 case "$1" in
  c)export USAGE='USAGE: jgit c ${GIT REPO}';if [ ! -z "$2" ];then git clone -j"$NPROC" --recurse-submodules --depth=1 "$URLGITSSHJ1NH0"/"$2";else usage;fi;;
  clean)git fetch --all;git reset --hard "$ORIGINMAIN";git clean -fd;;
  commit)git commit -m "$DATE"."$TIME";;
  def)
   for GITDEF in\
    "credential.usageer 'cache --timeout=28800'"\
    "fetch.prune true"\
    "http.postBuffer 2097152000"\
    "init.defaultBranch main"\
    "diff.submodule log"\
    "pull.rebase false"\
    "pack.threads $NPROC"\
   ;do git config --global $GITDEF;done;
  ;;
  extra)export USAGE='USAGE: jgit extra ${ lfs(uninstall) | l(icense) | r(eadme) }';
   case "$2" in
    lfs|lfsuninstall)git lfs uninstall;git rm -r --cached *;if [ -f ./.gitattributes ];then rm -f ./.gitattributes;fi;if [ -d ./.git/ ];then rm -rf ./.git/*;fi;;
    l|license)wget -O LICENSE https://raw.githubusercontent.com/j1nh0/j1nh0/main/LICENSE;;
    r|readme)tree --du -h>README.md;;
    *)usage;;
   esac;
  ;;
  origin)git remote show origin;;
  prune)git gc --aggressive --prune=now;git repack -Ad;git prune;git prune-packed;;
  push)if [[ $(git -v) ]];then git add -A;git commit -m "$DATE.$TIME";git push --force;sync;else echo "$MESSCMDFAIL";fi;;
  rmhist)rm -rf ./.git/;git init;git branch -m main;git remote add origin "ssh://git@github.com/j1nh0/${PWD##*/}.git";git add -A;git commit -m $(date +%Y%m%d%H%M%S);git push -f -v origin main;;
  *)usage;;
 esac;
}; #JGIT
jmir(){ export USAGE='USAGE: mirror ${ i(so) | m(erge) | o(utline) | s(hip) | w(ebsite) | n(isol) } ${SOURCE} ${DEST}';
 case "$1" in
  i|iso)rsync --recursive --whole-file --human-readable --verbose --update --delete /iso/ /j1nh0/;;
  m|merge)if [ ! -z $3 ];then rsync --recursive --whole-file --human-readable --verbose --update "$2" "$3";else usage;fi;;
  o|outline)if [ ! -z $2 ];then tree -dfi --noreport .|cut -c3-|xargs -I{} mkdir -vp "$2{}";else usage;fi;;
  s|ship)if [ ! -z $3 ];then rsync --recursive --whole-file --human-readable --verbose --update --remove-source-files "$2" "$3";else usage;fi;;
  w|website)if [ ! -z $2 ];then wget --random-wait -e robots=off --no-parent --page-requisites --mirror --convert-links --continue --recursive --user-agent='RIPPER PLUGIN' --show-progress "$2";else usage;fi;;
  n|nisol)for NISOL in $(ls -d */);do mirror ~/"$NISOL" ./"$NISOL";done;;
  usage)usage;;
  *)if [ ! -z $2 ];then rsync --recursive --whole-file --human-readable --verbose --update --delete "$1" "$2";else usage;fi;;
 esac;
}; #JMIR
jnet(){ export USAGE='USAGE: jnet ${ d(ns) | f(ip) | m(ip) | down | up }'
 case "$1" in
  d|dns)export USAGE='USAGE: dns ${ t(est) }';
   case "$2" in
    usage)usage;;
    t|test)
     for LIST in ${DNSI[@]};do echo -e -n "$LIST\t\t\t";ping -c2 "$LIST"|grep 'packet loss';done;
     for LIST in ${DNSD[@]};do echo -e -n "$LIST\t\t";ping -c2 "$LIST"|grep 'packet loss';done;
    ;;
    *)for LIST in ${DNSI[@]};do echo "nameserver $LIST"|sudo tee -a /etc/resolv.conf;done;;
   esac;
  ;;
  f|fip)export USAGE='USAGE: fip ${ IP ADDRESS }'
   if [ ! -z $2 ];then
    hashtag 4;trace -t "$2"|grep\
     -e 'IP Address'\
     -e 'Country'\
     -e 'Region'\
     -e 'City'\
     -e 'Zip code'\
     -e 'Time zone'\
     -e 'ISP';
    hashtag 4;curl https://db-ip.com/"$2"|grep\
     -e 'ipAddress'\
     -e 'continentCode'\
     -e 'continentName'\
     -e 'countryCode'\
     -e 'countryName'\
     -e 'stateProv'\
     -e 'city';
    hashtag 4
   else usage;fi;
  ;;
  m|mip)curl ifconfig.me;echo;;
  up)if [ ! -z $2 ];then sudo ip link set up "$2";else for LINK in $(ip addr|grep ^[0-99]|awk '{print substr($2, 1, length($2)-1)}');do sudo ip link set up "$LINK";done;fi;;
  down)if [ ! -z $2 ];then sudo ip link set down "$2";else for LINK in $(ip addr|grep ^[0-99]|awk '{print substr($2, 1, length($2)-1)}');do sudo ip link set down "$LINK";done;fi;;
  *)usage;;
 esac;
}; #JNET
modprobeusb(){ export USAGE='USAGE: modprobeusb #AS ROOT!#';if [ $(id -u) != '0' ];then usage;else modprobe --ignore-install usb_storage;modprobe uas;fi; }; #MODPROBEUSB
mp42mp3(){ export USAGE='USAGE: mp42mp3 ####IN SONG REPO####';
 for MP4 in *mp4;do
  ffmpeg -n -i "$MP4" -vn -acodec libmp3lame -ac 2 -ab 320k -ar 48000 "${MP4%.*}.mp3"
  if [ "$1" == '-k' ];then echo "$MP4 to ${MP4%.*}.mp3 completed";else rm "$MP4";fi
 done;
}; #MP42MP3
obliviate(){ find . -exec rm -rf {} \;&>"$NULL"; }; #OBLIVIATE
pdfreduce(){ find -type f -name "*pdf" -exec gs -sDEVICE=pdfwrite -dCompatabilityLevel=1.4 -dPDFSETTINGS=/ebook -dBATCH -dNOPAUSE -sOutputFile={}.pdf {} \; -exec mv -vf {}.pdf {} \;; }; #PDFREDUCE
perm(){ export USAGE='USAGE: perm ${ l(ock) | p(rivate) | u(nlock) | x|e(x)ecute } .';
 case "$1" in
  l|lock)export FPERM=0700;export DPERM=0700;;
  p|private)export FPERM=0664;export DPERM=0775;;
  u|unlock)export FPERM=0777;export DPERM=0777;;
  x|execute)export FPERM=0755;export DPERM=0755;;
  *)usage;exit 1;;
 esac
 find . -type d -exec chmod "$DPERM" {} \;;
 find . -type f -exec chmod "$FPERM" {} \;;
 find . -type d -exec chown 1001:65534 {} \;;
 find . -type f -exec chown 1001:65534 {} \;;
}; #PERM
ramdisk(){ export USAGE='USAGE: ramdisk ${ SIZE IN GIGABYTES }';
 if [ ! -d /ramdisk/ ];then sudo mkdir -vp /ramdisk/;fi;
 if [ ! -z $1 ];then sudo mount -t tmpfs -o size=$(echo "$1"*1024|bc)'M' tmpfs /ramdisk/&&echo $(echo "$1"*1024|bc)'M' pass||echo 'Ramdisk fail!';else usage;fi;
}; #RAMDISK
remount(){ export USAGE='USAGE: remount ${ c(drom) | s(ystem) }';
 case "$1" in
  c|cdrom)sudo mount -o rw,remount,rw /cdrom;;
  s|system)sudo mount -o rw,remount,rw /;;
  *)usage;;
 esac;
}; #REMOUNT
remove(){ export USAGE='USAGE: remove ${ e(mpty) | s(pace) }';
 case "$1" in
  e|empty)find -type f -empty -exec rm -rfv {} \;;find -type d -empty -exec rm -rfv {} \;;;
  s|space)find . -type d|rename 's/ /_/g';find . -type f|rename 's/ /_/g';;
  *)usage;;
 esac;
}; #REMOVE
repoinitlist(){ echo "$LINEAGEOS"; }; #REPOINITLIST
reposync(){ export USAGE='USAGE: reposync ${ r(eset) | s(low) | i(nit) ${ USER/REPO } }';
 case "$1" in
  r|reset)repo forall -c 'git reset --hard ; git clean -fdx';;
  s|slow)repo sync -j1 --fail-fast;;
  i|init)repo init --depth=1 -u "https://github.com/$2";;
  usage)usage;;
  *)repo sync -j$NPROC --force-sync -c;;
 esac;
}; #REPOSYNC
rmsyms(){ find . -type l -exec sh -c 'file -b "$1"|grep -q "^broken"' sh {} \; -print; }; #RMSYMS
rootlock(){
 sudo passwd -d "$ROOT";sudo usermod -L "$ROOT";
 if [ -d /"$ROOT"/ ];then find /"$ROOT"/ -type d -exec chmod 0700 {} \; -exec chown "$ROOT":"$ROOT" {} \;;fi;
 if [ -d /"$ROOT"/ ];then find /"$ROOT"/ -type f -exec chmod 0600 {} \; -exec chown "$ROOT":"$ROOT" {} \;;fi;
}; #ROOTLOCK
scrub(){ export USAGE='USAGE: scrub ${SOME FILE/DIR}';if [ ! -z $1 ];then exiftool -recurse -overwrite_original -all= "$1";else usage;fi; }; #SCRUB
snapc(){ export USAGE='USAGE: snapc ${ i(nstall) | l(ist) | re(move) | r(efresh) | s(ave) }'
 case "$1" in
  i|install)export USAGE='USAGE: snapi ${SOME SNAP PROGRAM}';if [ ! -z $2 ];then sudo snap install "$2";else usage;fi;;
  l|list)export USAGE='USAGE: snac l';if [ -z $2 ];then sudo snap list "$2";else usage;fi;;
  re|remove)export USAGE='USAGE: snapre ${SNAP TO REMOVE}';if [ ! -z $2 ];then sudo snap remove "$2";else usage;fi;;
  r|refresh)sudo snap refresh;;
  s|save)sudo snap save;;
  *)usage;;
 esac;
}; #SNAPC
ssha(){ export USAGE='USAGE: sshadd ${ SSH KEY }';if [ ! -z $1 ];then eval $(ssh-agent -k);eval $(ssh-agent -s);ssh-add -D;ssh-add "$1";else usage;fi; }; #SSHA
sshr(){ export USAGE='USAGE: sshr ${ COMMAND } ${ SOMEONE@SOME IP }';if [ ! -z $1 ];then ssh -X -f "$2" "$1";else usage;fi; }; #SSHR
sst(){ ss -tunlp; }; #SST
tpmunlock(){ export USAGE='USAGE: tpmunlock';
 for TPMUNLOCK in clevis clevis-tpm2 clevis-dracut clevis-luks;do if ! dpkg -s "$TPMUNLOCK"&>"$NULL";then apt install "$TPMUNLOCK";fi;done;
 echo -n 'Enter LUKS password:'&&read -s LUKSKEY&&echo;
 echo -n 'Enter LUKS device:'&&read LUKSDEVICE&&echo;
 echo "$LUKSKEY"|clevis luks bind -d "$LUKSDEVICE" tpm2 '{"pcr_bank":"sha256"}';
 dracut -vf --regenerate-all;clevis luks list -d "$LUKSDEVICE";
}; #TPMUNLOCK
ts(){ export USAGE='USAGE: ts #STANDALONE TIMESTAMP# ${ SOME FILE/DIR }';
 export TS="WHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)";
 export FILE=${1%.*};
 export EXT=${1##*.};
 if [ ! -z $1 ];then if [ -f $1 ];then mv $1 $FILE-$(date +%Y%m%d%H%M%S).$EXT;
 else if [ -d $1 ];then export DIR=${1%/};mv $1 $DIR-$(date +%Y%m%d%H%M%S)/;else echo "$USAGE";fi;
 fi;else echo -e "$TS"|tee "$STAMP";fi;
}; #TS
xconfigure(){ export USAGE='USAGE: xconfigure ${32} ${SOME CROSS CONFIGURE SCRIPT}';
 case "$1" in
  usage)usage;;
  32)./configure --build x86_64-pc-linux-gnu --host arm-linux-gnueabi LDFLAGS='-static -pthread';;
  *)./configure --build x86_64-pc-linux-gnu --host aarch64-linux-gnu LDFLAGS='-static -pthread';;
 esac
}; #XCONFIGURE
xmlviewer(){ export USAGE='USAGE: xmlviewer ${XML FILE}';if [ ! -z $1 ];then xmllint --format "$1"|highlight --syntax=xml --out-format=xterm256|less -RN;else usage;fi; }; #XMLVIEWER
# #UPDATE
# update(){
#  export SKELBIN='/etc/skel/.bin'
#  case "$1" in
#   adb-sync)cd /tmp/&&if dig +short http://github.com;then git clone https://github.com/google/adb-sync.git&&cp -Rfv adb-sync/* "$SKELBIN";rm -rfv adb-sync/;fi;;
#   platform-tools)cd /tmp/&&if dig +short http://dl.google.com;then wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip&&unzip -o platform-tools-latest-linux.zip&&cp -Rfv platform-tools/* "$SKELBIN"/;rm -rfv platform-tools/ platform-tools-latest-linux.zip*;fi;;
#   repo)cd /tmp/&&if dig +short http://storage.googleapis.com;then wget https://storage.googleapis.com/git-repo-downloads/repo -O "$SKELBIN"/repo;fi;;
#   yt-dlp)cd /tmp/&&if dig +short http://github.com;then wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O "$SKELBIN"/yt-dlp;fi;;
#   sqlbrowser)cd /tmp/&&if dig +short http://download.sqlitebrowser.org;then wget https://download.sqlitebrowser.org/DB.Browser.for.SQLite-v3.13.1-x86.64-v2.AppImage -O "$SKELBIN"/sqlbrowser;fi;;
#   payload-dumper)cd /tmp/&&if dig +short http://pypi.python.org;then pip install --break-system-packages payload-dumper;fi;;
#   qflipper)cd /tmp/&&if dig +short http://update.flipperzero.one;then wget https://update.flipperzero.one/builds/qFlipper/1.3.3/qFlipper-x86_64-1.3.3.AppImage -O "$SKELBIN"/qflipperr;fi;;
#   freecad)cd /tmp/&&if dig +short http://github.com;then wget https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage -O "$SKELBIN"/freecad;fi;;
#   cura)cd /tmp/&&if dig +short http://github.com;then wget https://github.com/Ultimaker/Cura/releases/download/5.7.2-RC2/UltiMaker-Cura-5.7.2-linux-X64.AppImage -O "$SKELBIN"/cura;fi;;
#   openshot)cd /tmp/&&if dig +short http://github.com;then wget https://github.com/OpenShot/openshot-qt/releases/download/v3.2.1/OpenShot-v3.2.1-x86_64.AppImage -O "$SKELBIN"/openshot;fi;;
#   upscayl)cd /tmp/&&if dig +short http://github.com;then wget https://github.com/upscayl/upscayl/releases/download/v2.11.5/upscayl-2.11.5-linux.AppImage -O "$SKELBIN"/upscayl;fi;;
#   whisper)cd /tmp/&&if dig +short http://github.com;then pip install --break-system-packages git+https://github.com/openai/whisper.git;fi;;
#   iptracer)cd /tmp/&&if dig +short http://github.com;then git clone https://github.com/rajkumardusad/IP-Tracer.git;cd IP-Tracer;bash install&>/dev/null;cd ..;rm -rf IP-Tracer;fi;;
#   cfg2html)cd /tmp/&&if dig +short http://github.com;then git clone https://github.com/cfg2html/cfg2html.git;cp -Rfv cfg2html/* "$SKELBIN"/;rm -rf cfg2html/;fi;;
#   torghost)cd /tmp/&&if dig +short http://github.com;then git clone https://github.com/SusmithKrishnan/torghost.git;cp -Rfv torghost/* "$SKELBIN"/;rm -rf torghost;fi;;
#   katoolin)cd /tmp/&&if dig +short http://github.com;then git clone https://github.com/LionSec/katoolin.git;cp -Rfv katoolin/* "$SKELBIN"/;rm -rf katoolin/;fi;;
#   install)
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update adb-sync;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update platform-tools;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update repo;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update yt-dlp;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update sqlbrowser;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update iptracer;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update cfg2html;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update torghost;fi
#    if [ -f "$SKELBIN"/update ];then bash "$SKELBIN"/update katoolin;fi
#   ;;
#   *)echo -e "\nUSAGE:\n\nupdate\n\tadb-sync\n\tplatform-tools\n\trepo\n\tyt-dlp\n\tsqlbrowser\n\tpayload-dumper\n\tqflipper\n\tfreecad\n\tcura\n\topenshot\n\tupscayl\n\twhisper\n\tiptracer\n\tcfg2html\n\ttorghost\n\tkatoolin\n\tinstall";;
#  esac
# };
