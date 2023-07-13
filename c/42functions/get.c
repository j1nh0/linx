/*get.c*/
}else if(strcmp(applet,"get")==0){
 void usage(){printf("\nUSAGE: get ${b(bios)|p(path)}\n\n");};
 if(argc==1){
  usage();
 }else if(strcmp(sel,"b")==0){
  system("sudo dmidecode -s system-serial-number");
 }else if(strcmp(sel,"p")==0){
  system("echo $PATH|tr ':' '\n'");
 }else{
  usage();
 };
