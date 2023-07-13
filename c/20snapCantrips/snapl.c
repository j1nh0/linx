/*snapl.c*/
}else if(strcmp(applet,"snapl")==0){
 if(argc==1){
  printf("\nPlease provide a package to list!\n\n");
 }else{
  sprintf(cmd,"sudo snap list %s",sel);
  system(cmd);
 };
