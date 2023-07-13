/*tear.c*/
}else if(strcmp(applet,"tear")==0){
 void usage(){printf("\nUSAGE: te ${FILE}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"split --verbose -b 1024M %s %s.&&rm -vf %s||echo 'Something went wrong with split!'",sel,sel,sel);
  system(cmd);
  sync();
 };
