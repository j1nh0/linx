/*update.c*/
}else if(strcmp(applet,"update")==0){
 void usage(){printf("\nUSAGE: update ${pf|rp|yt|all}\n\n");};
 void pf(){
  char *platform[1000]={
   "sudo wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip -O /tmp/platform-tools-latest-linux.zip",
   "sudo unzip -o /tmp/platform-tools-latest-linux.zip -d /tmp/",
   "sudo chmod -R 755 /tmp/platform-tools/",
   "sudo chown -R root:root /tmp/platform-tools/",
   "for PF in $(ls -A /tmp/platform-tools/);do mv -v /tmp/platform-tools/$PF /etc/skel/.bin/;done"
  };
  while(platform[i]!=NULL){
   sprintf(cmd,"%s",platform[i]);
   system(cmd);
   i++;
  };
 };
 void rp(){
  char *repo[1000]={
   "sudo wget https://storage.googleapis.com/git-repo-downloads/repo -O /etc/skel/.bin/repo",
   "sudo chmod 755 /etc/skel/.bin/repo"
  };
  while(repo[j]!=NULL){
   sprintf(cmd,"%s",repo[j]);
   system(cmd);
   j++;
  };
 };
 void yt(){
  char *youtube[1000]={
   "sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /etc/skel/.bin/yt-dlp",
   "sudo chmod 755 /etc/skel/.bin/yt-dlp"
  };
  while(youtube[k]!=NULL){
   sprintf(cmd,"%s",youtube[k]);
   system(cmd);
   k++;
  };
 };
 if(argc==1){
  usage();
 }else{
  system("if [ ! -d /etc/skel/.bin/ ];then sudo mkdir '/etc/skel/.bin/';fi");
  if(strcmp(sel,"all")==0){
   pf();
   rp();
   yt();
  }else if(strcmp(sel,"pf")==0){
   pf();
  }else if(strcmp(sel,"rp")==0){
   rp();
  }else if(strcmp(sel,"yt")==0){
   yt();
  }else{
   usage();
  };
 };
