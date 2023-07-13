/*ramdisk.c*/
}else if(strcmp(applet,"ramdisk")==0){
 void usage(){printf("\nUSAGE: ramdisk ${SIZE IN GIGABYTES}\n\n");};
 if(argc==1){
  usage();
 }else{
  system("if [ ! -d /ramdisk/ ];then sudo mkdir -vp /ramdisk/;fi");
  sprintf(cmd,"sudo mount -t tmpfs -o size=$(echo %s*1024|bc)'M' tmpfs /ramdisk/ && echo $(echo %s*1024|bc)'M' pass || echo 'Ramdisk fail!'",sel,sel);
  system(cmd);
 };
