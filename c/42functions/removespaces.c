/*removespaces.c*/
}else if(strcmp(applet,"removespaces")==0){
 system("find . -type d -print0|sort -rz|while read -d $'\0' f;do mv -v \"$f\" \"$(dirname \"$f\")/$(basename \"${f// /_}\")\";done");
 system("find . -type f -print0|sort -rz|while read -d $'\0' f;do mv \"$f\" \"${f// /_}\";done");
