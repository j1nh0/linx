/*snapre.c*/
}else if(strcmp(applet,"snapre")==0){
 if(argc==1){
  printf("\nPlease provide a package to remove!\n\n");
 }else{
  sprintf(cmd,"sudo snap remove %s",sel);
  system(cmd);
 };
