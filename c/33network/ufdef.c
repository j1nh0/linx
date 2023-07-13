/*ufdef.c*/
}else if(strcmp(applet,"ufdef")==0){
 char *ufdef[1000]={
  "default deny incoming",
  "default deny outgoing",
  "allow 22",
  "allow out 25",
  "allow out 53",
  "allow out 80",
  "allow out 123",
  "allow out 443",
  "allow out 500",
  "allow out 587",
  "allow out 1433"
 };
 char *ufdefsystem[1000]={
  "iptables -A OUTPUT -p icmp --icmp-type 8 -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT",
  "iptables -A INPUT -p icmp --icmp-type 0 -s 0/0 -m state --state ESTABLISHED,RELATED -j ACCEPT"
 };
 while(ufdef[i]!=NULL){
  sprintf(cmd,"sudo ufw %s",ufdef[i]);
  system(cmd);
  i++;
 };
 while(ufdefsystem[j]!=NULL){
  sprintf(cmd,"%s",ufdefsystem[j]);
  system(cmd);
  j++;
 };
