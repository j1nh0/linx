/*mk.c*/
}else if(strcmp(applet,"mk")==0){
 void usage(){printf("\nUSAGE: mk ${c|cl|dj|h|i|jc|k|p|q|sh|vc|bldsol|j1nh0|usage}\n\n");};
 if(argc==1){
  system("make -j$(nproc)");
 }else if(strcmp(sel,"c")==0){
  if(argc!=3){
   printf("\nUSAGE: mk c ${C PROGRAM}\n\n");
  }else{
   char *mkc[125]={
    "#include<stdio.h>",
    "#include<stdlib.h>",
    "int main(int argc,char *argv[]){",
    " /**/",
    "return(0);};"
   };
   sprintf(cmd,"touch %s%s;echo '/*%s%s*/'>>%s%s",sell,ec,sell,ec,sell,ec);
   system(cmd);
   while(mkc[i]!=NULL){
    sprintf(cmd,"echo '%s'>>%s%s",mkc[i],sell,ec);
    system(cmd);
    i++;
   };
   sprintf(cmd,"nano -ic %s%s",sell,ec);
   system(cmd);
  };
 }else if(strcmp(sel,"cl")==0){
  system("make clobber");
  system("make clean");
 }else if(strcmp(sel,"d")==0){
  char *dir[100]={"/etc/skel/.bin/","/iso/","/j1nh0/","/mnt/BLK/","/mnt/BRN/","/mnt/GRY/","/mnt/PLT/","/mnt/SLV/"};
  while(dir[i]!=NULL){
   sprintf(cmd,"mkdir -vp %s",dir[i]);
   system(cmd);
   i++;
  };
 }else if(strcmp(sel,"dj")==0){
  char *dirj[150]={
   "/iso/",
   "/j1nh0/",
   "/mnt/BLK/",
   "/mnt/BRN",
   "/mnt/PLT",
   "/mnt/SLV",
   "/mnt/GLD"
  };
  while(dirj[i]!=NULL){
   sprintf(cmd,"mkdir -vp %s",dirj[i]);
   system(cmd);
   i++;
  }
 }else if(strcmp(sel,"h")==0){
  if(argc!=3){
   printf("\nUSAGE: mk h ${FILE}\n\n");
  }else{
   sprintf(cmd,"sha512sum %s > %s-$(date +%%Y%%m%%d).sha512",sell,sell);
   system(cmd);
  };
 }else if(strcmp(sel,"i")==0){
  if(argc!=4){
   printf("\nUSAGE: mk i ${IMAGE FILE} ${SIZE IN GB}\n\n");
  }else{
   sprintf(cmd,"dd if=/dev/urandom of=./%s.img bs=512 count=$(echo %s*2097152|bc) status=progress",sell,selll);
   system(cmd);
  };

 }else if(strcmp(sel,"jc")==0){
  if(argc!=3){
   printf("\nUSAGE: mk jc ${C PROGRAM}\n\n");
  }else{
   sprintf(cmd,"touch %s%s;echo '/*%s.c*/'>>%s%s",sell,ec,sell,sell,ec);
   system(cmd);
   sprintf(cmd,"echo '}else if(strcmp(applet,\"%s\")==0){'>>%s%s",sell,sell,ec);
   system(cmd);
   sprintf(cmd,"nano -ic %s%s",sell,ec);
   system(cmd);
  };

 }else if(strcmp(sel,"k")==0){
  if(argc!=3){
   printf("\nUSAGE: mk k ${KEY NAME}\n\n");
  }else{
   sprintf(cmd,"openssl genrsa -out %s.piv 16384",sell);
   system(cmd);
   sprintf(cmd,"openssl rsa -in %s.piv -pubout -out %s.pub",sell,sell);
   system(cmd);
   sprintf(cmd,"openssl req -new -key %s.piv -out %s.csr -subj '/C=US/ST=CO/L=COLO SPGS/O=PRIVATE/OU=PRIVATE/CN=j1nh0m3lqu1st@gmail'",sell,sell);
   system(cmd);
   sprintf(cmd,"openssl x509 -req -in %s.csr -signkey %s.piv -out %s.crt",sell,sell,sell);
   system(cmd);
   sprintf(cmd,"ssh-keygen -y -f %s.piv>%s.ssh",sell,sell);
   system(cmd);
  };
 }else if(strcmp(sel,"p")==0){
  if(argc!=3){
   system("tr -cd [:alnum:]</dev/urandom|head -c 32;echo");
   waitcls();
  }else{
   sprintf(cmd,"tr -cd [:alnum:]</dev/urandom|head -c %s;echo",sell);
   system(cmd);
   waitcls();
  };
 }else if(strcmp(sel,"q")==0){
  if(argc!=3){
   printf("\nUSAGE: mk q ${NAME}\n\n");
  }else{
   sprintf(cmd,"touch %s.txt",sell);
   system(cmd);
   char *qr[1000]={
    "BEGIN:VCARD",
    "VERSION:3.0",
    "N:",
    "FN:",
    "TEL;TYPE=VOICE,CELL,PREF:",
    "TITLE:",
    "ORG:",
    "EMAIL:",
    "URL:",
    "END:VCARD",
    "EOF"
   };
   while(qr[i]!=NULL){
    sprintf(cmd,"echo \"%s\" >> %s.txt",qr[i],sell);
    system(cmd);
    i++;
   };
   sprintf(cmd,"nano -ic %s.txt&&qrencode -l H -s 6 -o %s.png<%s.txt",sell,sell,sell);
   system(cmd);
  };
 }else if(strcmp(sel,"sh")==0){
  if(argc!=3){
   printf("\nUSAGE: mk sh ${SHELL PROGRAM}\n\n");
  }else{
   sprintf(cmd,"touch %s%s;echo '#!/bin/bash -\n\nexit 0' >> %s%s",sell,esh,sell,esh);
   system(cmd);
   sprintf(cmd,"nano -ic %s%s",sell,esh);
   system(cmd);
  };
 }else if(strcmp(sel,"vc")==0){
  /*THIS NEEDS WORK*/
  void usage(){printf("\nUSAGE: mk vc ${NAME}\n\n");};
  if(argc==2){
   usage();
  }else{
   system("dd if=/dev/urandom of=./random bs=512 count=2048 status=progress");
   sync();
   sprintf(cmd,"veracrypt --text --create %s.vc --volume-type normal --encryption AES-Twofish-Serpent --hash sha-512 --filesystem exfat --pim 7 --random-source ./random",sel);
   system(cmd);
   sync();
   system("rm ./random");
  };
 }else if(strcmp(sel,"bldsol")==0){
  system("cp -fv ../.bashrc ../.bashrc.bckp");
  system("cat * > ../.bashrc");
  system("sudo cat ../.bashrc > /etc/skel/.bashrc");
  sync();
 }else if(strcmp(sel,"j1nh0")==0){
  system("cp -fv ../j1nh0.c ../j1nh0.c.bckp");
  system("cat */* > ../j1nh0.c");
  sync();
 }else if(strcmp(sel,"usage")==0){
  usage();
 }else{
  sprintf(cmd,"make -j$(nproc) %s",sel);
  system(cmd);
 };
