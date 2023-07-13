/*backup.c*/
}else if(strcmp(applet,"backup")==0){
 void usage(){printf("\nUSAGE: backup ${SOME FILE/FOLDER}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"cp -rfv %s %s.bckp",sel,sel);
  system(cmd);
  sync();
 };
