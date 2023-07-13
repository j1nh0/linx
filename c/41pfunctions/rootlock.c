/*rootlock.c*/
}else if(strcmp(applet,"rootlock")==0){
 void usage(){printf("\nUSAGE: rootlock ${l|u}\n\n");};
 if(argc==1){
  usage();
 }else if(strcmp(sel,"l")==0){
  system("sudo usermod -L root");
 }else if(strcmp(sel,"u")==0){
  system("sudo usermod -U root");
 }else{
  usage();
 };
