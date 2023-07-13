/*aptanydesk.c*/
}else if(strcmp(applet,"aptanydesk")==0){
 char *anydesk[1000]={
  "sudo curl -s https://keys.anydesk.com/repos/DEB-GPG-KEY | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/anydesk-stable.gpg > /dev/null",
  "sudo echo 'deb http://deb.anydesk.com/ all main' | sudo tee /etc/apt/sources.list.d/anydesk-stable.list",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends update",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends install anydesk"
 };
 sprintf(cmd,"%s update",apt);
 system(cmd);
 while(anydesk[i]!=NULL){
  sprintf(cmd,"%s",anydesk[i]);
  system(cmd);
  i++;
 };
