/*aptbinaries.c*/
}else if(strcmp(applet,"aptbinaries")==0){
 char *binaries[1000]={
  "sudo wget https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage -O /etc/skel/.bin/lmms",
  "sudo chmod 755 /etc/skel/.bin/lmms",
  "sudo wget https://github.com/balena-io/etcher/releases/download/v1.18.4/balenaEtcher-1.18.4-x64.AppImage -O /etc/skel/.bin/balenaEtcher",
  "sudo chmod 755 /etc/skel/.bin/balenaEtcher",
  "sudo wget https://update.flipperzero.one/builds/qFlipper/1.3.0/qFlipper-x86_64-1.3.0.AppImage -O /etc/skel/.bin/qflipper",
  "sudo chmod 755 /etc/skel/.bin/qflipper",
  "sudo wget https://github.com/FreeCAD/FreeCAD/releases/download/0.20.2/FreeCAD_0.20.2-2022-12-27-conda-Linux-x86_64-py310.AppImage -O /etc/skel/.bin/FreeCAD",
  "sudo chmod 755 /etc/skel/.bin/FreeCAD",
  "sudo wget https://github.com/Ultimaker/Cura/releases/download/5.3.1/UltiMaker-Cura-5.3.1-linux-modern.AppImage -O /etc/skel/.bin/Cura",
  "sudo chmod 755 /etc/skel/.bin/Cura",
  "sudo wget https://assets.checkra.in/downloads/linux/cli/x86_64/dac9968939ea6e6bfbdedeb41d7e2579c4711dc2c5083f91dced66ca397dc51d/checkra1n -O /etc/skel/.bin/checkra1n",
  "sudo chmod 755 /etc/skel/.bin/checkra1n",
  "sudo wget https://github.com/BCN3D/Stratos/releases/download/v1.6.3/BCN3D_Stratos-1.6.3.AppImage -O /etc/skel/.bin/BCN3D",
  "sudo chmod 755 /etc/skel/.bin/BCN3D",
  "sudo wget https://github.com/unetbootin/unetbootin/releases/download/702/unetbootin-linux64-702.bin -O /etc/skel/.bin/unetbootin",
  "sudo chmod 755 /etc/skel/.bin/unetbootin"
 };
 sprintf(cmd,"%s update",apt);
 system(cmd);
 while(binaries[i]!=NULL){
  sprintf(cmd,"%s",binaries[i]);
  system(cmd);
  i++;
 };
