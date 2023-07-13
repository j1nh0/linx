/*apti.c*/
}else if(strcmp(applet,"apti")==0){
 void usage(){printf("\nPlease provide a package to install!\n\n");};
 if(argc==1){
  usage();
 }else{
  aptu();
  int o=1;
  while(argv[o]!=NULL){
   sprintf(cmd,"%s install %s",apt,argv[o]);
   system(cmd);
   o++;
  };
 };
