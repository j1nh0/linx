/*aptqemu.c*/
}else if(strcmp(applet,"aptqemu")==0){
 char *aptqemu[100]={
  "qemu",
  "qemubuilder",
  "qemu-efi-aarch64",
  "qemu-guest-agent",
  "qemu-system-arm",
  "qemu-system-mips",
  "qemu-system-ppc",
  "qemu-system-sparc",
  "qemu-user",
  "qemu-block-extra",
  "qemu-efi",
  "qemu-efi-arm",
  "qemu-system",
  "qemu-system-common",
  "qemu-system-gui",
  "qemu-system-misc",
  "qemu-system-s390x",
  "qemu-system-x86",
  "qemu-user-binfmt",
  "qemu-utils"
 };
 sprintf(cmd,"%s update",apt);
 system(cmd);
 while(aptqemu[i]!=NULL){
  sprintf(cmd,"%s install %s",apt,aptqemu[i]);
  system(cmd);
  i++;
 };
