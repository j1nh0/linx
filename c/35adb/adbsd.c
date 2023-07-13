/*adbsd.c*/
}else if(strcmp(applet,"adbsd")==0){
 char *adbsd[1000]={
  "DCIM",
  "Download",
  "Pictures"
 };
 system("if [ ! -d ./sdcard/ ];then mkdir -vp ./sdcard/;fi");
 while(adbsd[i]!=NULL){
  sprintf(cmd,"adb pull /sdcard/%s ./sdcard/;if [ \"$?\" = '0' ];then sync;adb shell rm -rfv /sdcard/%s/*;else echo '%s not found!';fi",adbsd[i],adbsd[i],adbsd[i]);
  system(cmd);
  i++;
 };
