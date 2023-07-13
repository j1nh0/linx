/*adbcontacts.c*/
}else if(strcmp(applet,"adbcontacts")==0){
 char *adbcontacts[1000]={
  "adb start-server",
  "sleep 5",
  "adb root",
  "adb pull /data/data/com.android.providers.contacts/databases/contacts2.db ./contacts2-$(date +%Y%m%d).db",
  "db2vcf ./contacts2-$(date +%Y%m%d).db > Contacts-$(date +%Y%m%d).vcf",
  "adb unroot"
 };
 while(adbcontacts[i]!=NULL){
  sprintf(cmd,"%s",adbcontacts[i]);
  system(cmd);
  sync();
  i++;
 };
