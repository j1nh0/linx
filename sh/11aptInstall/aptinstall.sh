#aptinstall.sh
~/.bin/aptinstall)
 export USAGE='USAGE: aptinstall ${ b(arebones) | r(epo) }'
 case "$1" in
  b|barebones)
   for APTBAREBONES in\
    'build-essential' 'bash' 'bc' 'binutils-aarch64-linux-gnu' 'binutils-arm-linux-gnueabi' 'bison' 'bleachbit'\
    'ca-certificates' 'cmake' 'crunch' 'cryptsetup' 'cubic' 'curl'\
    'deluge' 'dosfstools'\
    'ffmpeg' 'flatpak'\
    'gcc-12' 'gcc-aarch64-linux-gnu' 'gcc-arm-linux-gnueabihf' 'ghostscript' 'git' 'git-core' 'git-lfs' 'gparted' 'gzip'\
    'htop'\
    'inxi'\
    'libfuse2' 'libgoogle-perftools4' 'libgoogle-perftools-dev' 'libtcmalloc-minimal4'\
    'macchanger' 'make' 'mtools'\
    'nmap'\
    'pigz' 'pip'\
    'qrencode'\
    'remmina' 'rename'\
    'screen' 'sed' 'shc' 'solaar' 'sqlite' 'squashfs-tools' 'ssh'\
    'tpm2-tools' 'tree'\
    'veracrypt' 'vlc'\
    'zip'\
   ;do
    apt install "$APTBAREBONES"
   done
  ;;
  r|repo)
   export RELEASE=$(lsb_release -sc 2>/dev/null)
   case "$RELEASE" in
    noble)export REPORELEASE="'deb http://archive.ubuntu.com/ubuntu/ jammy universe main multiverse restricted' 'deb http://security.ubuntu.com/ubuntu/ jammy-security universe main multiverse restricted' 'deb http://archive.ubuntu.com/ubuntu/ jammy-updates universe main multiverse restricted'";;
    jammy)export REPORELEASE="'deb http://archive.ubuntu.com/ubuntu/ bionic universe main multiverse restricted' 'deb http://security.ubuntu.com/ubuntu/ bionic-security universe main multiverse restricted' 'deb http://archive.ubuntu.com/ubuntu/ bionic-updates universe main multiverse restricted'";;
    *)echo "Release $RELEASE not found!"
   esac
   for APTREPO in "$REPORELEASE";do add-apt-repository -y "$APTREPO";done
   for APTREPO in\
    'universe' 'multiverse' 'restricted'\
    'ppa:cubic-wizard/release'\
    'ppa:unit193/encryption'\
    'deb http://archive.ubuntu.com/ubuntu/ focal universe main multiverse restricted'\
    'deb http://security.ubuntu.com/ubuntu/ focal-security universe main multiverse restricted'\
    'deb http://archive.ubuntu.com/ubuntu/ focal-updates universe main multiverse restricted'\
   ;do
    add-apt-repository -y "$APTREPO"
   done
  ;;
  *)usage;;
 esac
;;
