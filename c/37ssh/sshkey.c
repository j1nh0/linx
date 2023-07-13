/*sshkey.c*/
}else if(strcmp(applet,"sshkey")==0){
 void usage(){printf("\nUSAGE: sshkey ${SOMEONE}@${IP ADDR}\n\n");};
 if(argc==1){
  usage();
 }else{
  system("ssh-keygen");
  sprintf(cmd,"ssh-copy-id %s",sel);
  system(cmd);
 };
