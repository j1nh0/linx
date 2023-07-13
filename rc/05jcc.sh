####
#05jcc.sh
####
jcc(){
 export ORIG="$1"
 export ORIGBCKP="$1"".bckp"
 export INCLUDE='#include<assert.h>
#include<ctype.h>
#include<errno.h>
#include<math.h>
#include<signal.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<time.h>
#include<unistd.h>'
 export DEFINE='#define EQ ==
#define NE !=
#define GT >
#define LT <
#define GE >=
#define LE <=
#define PI 3.14159
#define EVER ;;
#define ECHOFLAGS (ECHO | ECHOE | ECHOK | ECHONL)'
 export INTMAIN='int main(int argc,char *argv[]){'
 export INITIALIZE='int a,b,c;
int i,j,k;
int x,y,z;
int ret=0;
char *applet=argv[0];
char *sel=argv[1];
char *sell=argv[2];
char *selll=argv[3];
char *sellll=argv[4];
char cmd[1000];
char tmpcmd[1000];
char *ec=".c";
char *esh=".sh";
char *apt="sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends";
char *dpkgreconf="sudo dpkg-reconfigure -f noninteractive -p critical";'
 export FUNCTION='void cls(){system("clear");};
void waitcls(){sleep(3);system("clear");};
void badinput(){cls();printf("\nBad input, try again!\n\n");exit(1);};
void hashtag(){printf("\n################################\n\n");};
void hold(){char hold[9];printf("Program hold:");scanf("%8s",hold);};
/*SYSTEM FUNCTIONS*/
void sync(){system("sync");};
void aptu(){sprintf(cmd,"%s update",apt);system(cmd);};
void apti(){sprintf(cmd,"%s install",apt);system(cmd);};
/*HARD FUNCTIONS*/
int isDir(const char *fileName){struct stat path;stat(fileName, &path);return S_ISREG(path.st_mode);};'
 export MAINLOGIC=$(cat "$1")
 export MAINRETURNCLOSE='return(0);};'
####COMMENT OUT DEBUG VERSION####
####THIS NEEDS WORK####
# cat << EOF >> "${1%.*}.working.c"
 cat << EOF | gcc -xc -o "${1%.*}" --static -
$INCLUDE
$DEFINE
$INTMAIN
$INITIALIZE
$FUNCTION
$MAINLOGIC
$MAINRETURNCLOSE
EOF
 if [ "$?" == '0' ];then echo -n "GCC ${1%.*} pass,";else echo 'SOMETHING WENT WRONG WITH GCC!';read NULLVAR;fi
 if [ "$?" == '0' ];then echo -n " strip";strip "${1%.*}";else echo 'SOMETHING WENT WRONG WITH BACKUP!';fi
 if [ "$?" == '0' ];then echo -n " pass, strip-all";strip --strip-all "${1%.*}";else echo 'SOMETHING WENT WRONG WITH STRIP!';fi
 if [ "$?" == '0' ];then echo -n " pass, strip-debug";strip --strip-debug "${1%.*}";else echo 'SOMETHING WENT WRONG WITH STRIP --STRIP-ALL!';fi
 if [ "$?" == '0' ];then echo " pass";else echo 'SOMETHING WENT WRONG WITH STRIP --STRIP-DEBUG!';fi
}
