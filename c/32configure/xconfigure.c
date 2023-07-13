/*xconfigure.c*/
}else if(strcmp(applet,"xconfigure")==0){
 system("./configure --build x86_64-pc-linux-gnu --host aarch64-linux-gnu LDFLAGS='-static -pthread'");
