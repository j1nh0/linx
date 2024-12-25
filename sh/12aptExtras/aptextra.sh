#aptextra.sh
~/.bin/aptextra)
 export USAGE='USAGE: aptextra ${ all | libdvd-pkg | mega | qemu | unattended | visualstudio | protonvpn }'
 case "$1" in
  libdvd-pkg)
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
  mega)
   aptu
   wget https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megacmd_1.7.0-6.1_amd64.deb
   apt install ./megacmd_1.7.0-6.1_amd64.deb&&sync&&rm ./megacmd_1.7.0-6.1_amd64.deb
  ;;
  qemu)
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
  unattended)
   aptu
   apt install unattended-upgrades
   dpkgreconf unattended-upgrades
  ;;
  visualstudio)
   apt install wget gpg apt-transport-https
   wget -qO- https://packages.microsoft.com/keys/microsoft.asc|gpg --dearmor>packages.microsoft.gpg
   install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
   echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main"|tee /etc/apt/sources.list.d/vscode.list>/dev/null
   rm -f packages.microsoft.gpg
   apt update
   apt install -y code
  ;;
  protonvpn)
   wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.4_all.deb
   dpkg -i ./protonvpn-stable-release_1.0.4_all.deb&&apt update&&apt upgrade
   apt install proton-vpn-gnome-desktop
   aptdi
  ;;
  all)
   for APTEXTRA in\
    'libdvd-pkg'\
    'mega'\
    'qemu'\
    'unattended'\
    'visualstudio'\
    'protonvpn'\
   ;do aptextra "$APTEXTRA";done
  ;;
  *)usage;;
 esac
;;
