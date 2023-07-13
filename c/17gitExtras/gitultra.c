/*gitultra.c*/
}else if(strcmp(applet,"gitultra")==0){
 char *gitultra[1000]={
  "https://github.com/ChrisRfr/Win10XPE.git",
  "https://github.com/ssut/payload-dumper-go.git",
  "https://github.com/LineageOS/scripts.git",
  "https://github.com/INT3NSE07/better-adb-sync.git",
  "https://github.com/MindTheGapps/vendor_gapps.git",
  "https://github.com/TheMuppets/manifests.git",
  "https://github.com/flipperdevices/flipperzero-firmware.git",
  "https://github.com/neverfa11ing/FlipperMusicRTTTL.git",
  "https://github.com/neverfa11ing/FlipperAmiibosNFC.git",
  "https://github.com/neverfa11ing/ducky.git",
  "https://github.com/RogueMaster/FlipperAmiibo",
  "https://github.com/RogueMaster/RogueMaster",
  "https://github.com/RogueMaster/awesome-flipperzero-withModules",
  "https://github.com/RogueMaster/flippermaker.github.io",
  "https://github.com/RogueMaster/flipperzero-firmware-wPlugins",
  "https://github.com/UNC0V3R3D/Flipper_Zero-BadUsb.git",
  "https://github.com/UNC0V3R3D/Flipper-Zero-BadUSB.git",
  "https://github.com/logickworkshop/Flipper-IRDB.git",
  "https://github.com/nonamecoder/FlipperZeroHondaFirmware.git",
  "https://github.com/nonamecoder/ECE263.git",
  "https://github.com/nonamecoder/CVE-2022-27254.git",
  "https://github.com/hak5/usbrubberducky-payloads.git",
  "https://github.com/CartoType/CartoType-Public.git"
 };
 void usage(){printf("\nUSAGE: gitultra ${l|c}\n\n");};
 if(argc==1){
  /*THIS NEEDS WORK*/
  system("for GITULTRAUPDATE in $(ls -d */);do cd $GITULTRAUPDATE;echo $GITULTRAUPDATE;git fetch --all;git reset --hard origin;git pull origin;cd ..;done");
 }else if(strcmp(sel,"l")==0){
  while(gitultra[i]!=NULL){
   printf("%s\n",gitultra[i]);
   i++;
  };
 }else if(strcmp(sel,"c")==0){
  while(gitultra[i]!=NULL){
   sprintf(cmd,"git clone %s",gitultra[i]);
   system(cmd);
   i++;
  };
 }else{
  usage();
 };
