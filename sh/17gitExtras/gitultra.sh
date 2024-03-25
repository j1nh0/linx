#gitultra.sh
~/.bin/gitultra)
 export USAGE='USAGE: gitultra ${l(ist)|c(lone)}'
 read -r -d '' GITULTRA<<EOM
https://github.com/ChrisRfr/Win10XPE.git
https://github.com/LineageOS/scripts.git
https://github.com/INT3NSE07/better-adb-sync.git
https://gitlab.com/MindTheGapps/vendor_gapps.git
https://github.com/TheMuppets/manifests.git
https://github.com/topjohnwu/Magisk.git
https://github.com/flipperdevices/flipperzero-firmware.git
https://github.com/neverfa11ing/FlipperMusicRTTTL.git
https://github.com/neverfa11ing/FlipperAmiibosNFC.git
https://github.com/RogueMaster/FlipperAmiibo
https://github.com/RogueMaster/RogueMaster
https://github.com/RogueMaster/awesome-flipperzero-withModules
https://github.com/RogueMaster/flippermaker.github.io
https://github.com/RogueMaster/flipperzero-firmware-wPlugins
https://github.com/UNC0V3R3D/Flipper_Zero-BadUsb.git
https://github.com/UNC0V3R3D/Flipper-Zero-BadUSB.git
https://github.com/logickworkshop/Flipper-IRDB.git
https://github.com/hak5/usbrubberducky-payloads.git
https://github.com/dogbert/bios-pwgen.git
https://github.com/bacher09/pwgen-for-bios.git
https://github.com/NagiosEnterprises/nagioscore.git
https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
EOM
 case "$1" in
  l)for GITULTRALIST in "$GITULTRA";do echo "$GITULTRALIST";done;;
  c)for GITULTRACLONE in $(echo $GITULTRA|tr ' ' '\n');do gitc "$GITULTRACLONE";done;;
  *)
   for GITULTRAUPDATE in $(ls -d */);do
    cd $GITULTRAUPDATE&>/dev/null
    echo -e "\nPWD: $GITULTRAUPDATE\n"
    gitpull force
    hashtag 16
    cd ..&>/dev/null
   done
   if [ "$(basename $PWD)" == 'git' ];then echo -e "\nPWD is 'git'; pushing now!\n";gitpush main;fi
  ;;
 esac
;;
