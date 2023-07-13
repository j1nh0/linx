/*attribwalk.c*/
}else if(strcmp(applet,"attribwalk")==0){
 void usage(){printf("\nUSAGE: attribwalk ${DEV DEVICE}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"sudo udevadm info --attribute-walk %s",sel);
  system(cmd);
 };
