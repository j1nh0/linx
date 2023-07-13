/*xconfigure32.c*/
}else if(strcmp(applet,"xconfigure32")==0){
 system("./configure --build x86_64-pc-linux-gnu --host arm-linux-gnueabi LDFLAGS='-static -pthread'");
