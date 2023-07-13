/*repoinitlist.c*/
}else if(strcmp(applet,"repoinitlist")==0){
 char *repoinitlist[1000]={
  "repo init -u https://github.com/LineageOS/android.git -b lineage-20.0",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-19.1",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-19.0",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-18.1",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-18.0",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-17.1",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-17.0",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-16.0",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-15.1",
  "repo init -u https://github.com/LineageOS/android.git -b lineage-15.0",
  "repo init -u https://github.com/LineageOS/android.git -b cm-14.1",
  "repo init -u https://github.com/LineageOS/android.git -b cm-14.0",
  "repo init -u https://github.com/LineageOS/android.git -b cm-13.0",
  "repo init -u https://github.com/LineageOS/android.git -b cm-12.1",
  "repo init -u https://github.com/LineageOS/android.git -b cm-12.0",
  "repo init -u https://github.com/LineageOS/android.git -b cm-11.0"
 };
 while(repoinitlist[i]!=NULL){
  printf("%s\n",repoinitlist[i]);
  i++;
 };
