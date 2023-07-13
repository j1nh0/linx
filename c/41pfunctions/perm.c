/*perm.c*/
}else if(strcmp(applet,"perm")==0){
 void usage(){printf("\nUSAGE: perm ${r(755)|s(700)|u(777)} .\n\n");};
 if(argc==1){
  usage();
 }else if(strcmp(sel,"r")==0){
  system("find . -type d -exec chmod 755 {} \\;");
  system("find . -type f -exec chmod 755 {} \\;");
  system("find . -type d -exec chown $(whoami):$(whoami) {} \\;");
  system("find . -type f -exec chown $(whoami):$(whoami) {} \\;");
 }else if(strcmp(sel,"s")==0){
  system("find . -type d -exec chmod 700 {} \\;");
  system("find . -type f -exec chmod 700 {} \\;");
  system("find . -type d -exec chown $(whoami):$(whoami) {} \\;");
  system("find . -type f -exec chown $(whoami):$(whoami) {} \\;");
 }else if(strcmp(sel,"u")==0){
  system("find . -type d -exec chmod 777 {} \\;");
  system("find . -type f -exec chmod 777 {} \\;");
  system("find . -type d -exec chown $(whoami):$(whoami) {} \\;");
  system("find . -type f -exec chown $(whoami):$(whoami) {} \\;");
 }else{
  usage();
 };
