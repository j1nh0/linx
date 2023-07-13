/*dns.c*/
}else if(strcmp(applet,"dns")==0){
 char *dnsd[100]={
  "quad9.net",
  "cloudflare.com",
  "google.com"
 };
 char *dnsi[100]={
  "9.9.9.9",
  "1.1.1.1",
  "8.8.8.8"
 };
 void usage(){printf("\nUSAGE: dns ${s(set)|t(test) d(dns) || i(ip)}\n\n");};
 void s(){
  while(dnsi[i]!=NULL){
   sprintf(cmd,"echo 'nameserver %s'|sudo tee -a /etc/resolv.conf",dnsi[i]);
   system(cmd);
   i++;
  };
 };
 void t(){
  if(argc!=3){
   usage();
  }else{
   if(strcmp(sell,"d")==0){
    while(dnsd[i]!=NULL){
     printf("Testing %s\n",dnsd[i]);
     sprintf(cmd,"ping -c 2 %s|grep 'packet loss'",dnsd[i]);
     system(cmd);
     printf("\n");
     i++;
    };
   }else if(strcmp(sell,"i")==0){
    while(dnsi[i]!=NULL){
     printf("Testing %s\n",dnsi[i]);
     sprintf(cmd,"ping -c 2 %s|grep 'packet loss'",dnsi[i]);
     system(cmd);
     printf("\n");
     i++;
    };
   }else{
    usage();
   };
  };
 };
 if(argc==1){
  usage();
 }else{
  if(strcmp(sel,"s")==0){
   s();
  }else if(strcmp(sel,"t")==0){
   t();
  }else{
   usage();
  };
 };
