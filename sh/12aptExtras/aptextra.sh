#aptextra.sh
~/.bin/aptextra)
 export USAGE='USAGE: aptextra ${ l(ibdvd-pkg) | m(ega) | q(emu) | u(nattended) | mssql }'
 case "$1" in
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
   for APTMEGA in 'megasync_5.4.0-1.1_amd64.deb' 'megacmd_1.7.0-6.1_amd64.deb';do
    wget https://mega.nz/linux/repo/xUbuntu_24.04/amd64/"$APTMEGA"
    apt install ./"$APTMEGA"
    sync
    rm ./"$APTMEGA"
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
  mssql)
   if [ $(id -u) != '0' ];then echo 'Please try again as root!';else
    curl https://packages.microsoft.com/keys/microsoft.asc|tee /etc/apt/trusted.gpg.d/microsoft.asc
    curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list|tee /etc/apt/sources.list.d/mssql-release.list
    apt update
    ACCEPT_EULA=Y apt install -y msodbcsql18 mssql-tools18 unixodbc-dev
   fi
  ;;
  *)usage;;
 esac
;;
