/*aptp.c*/
}else if(strcmp(applet,"aptp")==0){
 void usage(){printf("\nUSAGE: aptp ${PACKAGE(S)}\n\n");};
 int o=1;
 if(argc==1){
  usage();
 }else{
  while(argv[o]!=NULL){
   sprintf(cmd,"sudo apt purge %s",argv[o]);
   system(cmd);
   o++;
  };
 };
