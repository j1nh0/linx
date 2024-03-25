#aptextra.sh
~/.bin/aptextra)
 export USAGE='USAGE: aptextra ${ j(ammy2focal) | l(ibdvd-pkg) | m(ega) | q(emu) | u(nattended) }'
 case "$1" in
  j|jammy2focal)
   aptc
   if [ ! -f /etc/apt/sources.list.bckp ];then cp -v /etc/apt/sources.list /etc/apt/sources.list.bckp;fi
    cat<<EOF>/etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ jammy universe main multiverse restricted
deb http://security.ubuntu.com/ubuntu/ jammy-security universe main multiverse restricted
deb http://archive.ubuntu.com/ubuntu/ jammy-updates universe main multiverse restricted
deb http://archive.ubuntu.com/ubuntu/ focal universe main multiverse restricted
deb http://security.ubuntu.com/ubuntu/ focal-security universe main multiverse restricted
deb http://archive.ubuntu.com/ubuntu/ focal-updates universe main multiverse restricted
EOF
   aptu
  ;;
  l|libdvd-pkg)
   aptu
   for APTLIBDVDPKG in\
    'libdvdcss-dev'\
    'libdvdcss2'\
    'libdvdread-dev'\
    'libdvdread8'\
    'libdvdnav4'\
    'libdvd-pkg'\
   ;do
    apt install "$APTLIBDVDPKG"
   done
   dpkgreconf libdvd-pkg
  ;;
  m|mega)
   aptu
   for APTMEGA in 'megasync' 'nautilus-megasync' 'megacmd';do
    wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/"$APTMEGA"-xUbuntu_22.04_amd64.deb
    apt install ./"$APTMEGA"-xUbuntu_22.04_amd64.deb
    rm "$APTMEGA"-xUbuntu_22.04_amd64.deb
   done
  ;;
  q|qemu)
   aptu
   for APTQEMU in\
    "qemu" "qemubuilder" "qemu-efi-aarch64" "qemu-guest-agent" "qemu-system-arm" "qemu-system-mips"\
    "qemu-system-ppc" "qemu-system-sparc" "qemu-user" "qemu-block-extra" "qemu-efi" "qemu-efi-arm" "qemu-system"\
    "qemu-system-common" "qemu-system-gui" "qemu-system-misc" "qemu-system-s390x" "qemu-system-x86"\
    "qemu-user-binfmt" "qemu-utils"\
   ;do
    apt install "$APTQEMU"
   done
  ;;
  u|unattended)
   aptu
   apt install unattended-upgrades
   dpkgreconf unattended-upgrades
  ;;
  *)usage;;
 esac
;;
