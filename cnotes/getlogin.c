/*getlogin.c*/
}else if(strcmp(applet,"getlogin")==0){
 char *cuserid(char *s);
 char *user;
 user=(char *)malloc(10*sizeof(char));
 cuserid(user);
 if(strcmp(user,"root")!=0){
  printf("\nNot root!\n\n");
 }else{
  printf("\nPassing logic here!\n\n");
 };
