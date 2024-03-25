/*shownull.c*/
}else if(strcmp(applet,"shownull")==0){
 #define STR(x) #x
 #define SHOW_DEFINE(x) printf("%s=%s\n",#x,STR(x))
 SHOW_DEFINE(NULL);
