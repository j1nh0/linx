/*gitc.c*/
}else if(strcmp(applet,"gitc")==0){
 if(argc==1){
  printf("\nPlease provide a repo to clone!\n\n");
 }else{
  sprintf(cmd,"git clone %s",sel);
  system(cmd);
 };
