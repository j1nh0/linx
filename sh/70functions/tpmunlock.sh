#tpmunlock.sh
~/.bin/tpmunlock)
 export USAGE='USAGE: tpmunlock .'
 case "$1" in
  usage)usage;;
  *)
   #install needed packages
   apt -y install clevis clevis-tpm2 clevis-luks clevis-initramfs initramfs-tools tss2
   #proceed
   echo -n 'Enter LUKS password:'&&read -s LUKSKEY&&echo
   echo -n 'Enter LUKS device:'&&read LUKSDEVICE&&echo
   clevis luks bind -d "$LUKSDEVICE" tpm2 '{"pcr_bank":"sha256"}' <<< "$LUKSKEY"
   update-initramfs -u -k all
   #check
   clevis luks list -d "$LUKSDEVICE"
   #delete example; -s is one of the slots reported by the previous command
   #clevis luks unbind -d /dev/nvme0n1p3 -s 1 tpm2
  ;;
 esac
;;
