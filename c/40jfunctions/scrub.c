/*scrub.c*/
}else if(strcmp(applet,"scrub")==0){
 void usage(){printf("\nUSAGE: scrub ${SOME FILE/DIR}\n\n");};
 if(argc==1){
  usage();
 }else{
  ret=isDir(sel);
  if(ret==0){
   sprintf(cmd,"exiftool -recurse -overwrite_original -all= '%s'",sel);
   system(cmd);
  }else{
   sprintf(cmd,"exiftool -overwrite_original -all= '%s'",sel);
   system(cmd);
  };
 };
