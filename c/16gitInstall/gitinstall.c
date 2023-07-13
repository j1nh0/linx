/*gitinstall.c*/
}else if(strcmp(applet,"gitinstall")==0){
 void usage(){printf("\nUSAGE: gitinstall ${iptracer|all}\n\n");};
 void iptracer(){
  system("git clone https://github.com/rajkumardusad/IP-Tracer.git&&cd IP-Tracer&&bash install&&cd ..&&rm -rf IP-Tracer");
 };
 if(argc==1){
  usage();
 }else if(strcmp(sel,"all")==0){
  iptracer();
 }else if(strcmp(sel,"iptracer")==0){
  iptracer();
 }else{
  usage();
 };
