/*gitsubadd.c*/
}else if(strcmp(applet,"gitsubadd")==0){
 if(argc==1){
  printf("\nPlease provide URL for git submodule add\n\nUSAGE: gitsubadd $URL\n");
 }else{
  sprintf(cmd,"git submodule add %s",sel);
  system(cmd);
 };
