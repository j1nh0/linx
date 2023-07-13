/*imirror.c*/
}else if(strcmp(applet,"imirror")==0){
 system("rsync --archive --progress --human-readable --whole-file /iso/ /j1nh0/");
 sync();
