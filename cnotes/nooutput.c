#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <errno.h>
#define ECHOFLAGS (ECHO | ECHOE | ECHOK | ECHONL)
int set_disp_mode(int fd,int option){
 int err;
 struct termios term;
 if(tcgetattr(fd,&term)==-1){
     perror("Cannot get the attribution of the terminal");
     return 1;
   }else{
   if(option){
        term.c_lflag|=ECHOFLAGS;
   }else{
        term.c_lflag &=~ECHOFLAGS;
   err=tcsetattr(fd,TCSAFLUSH,&term);
   };
   };
   if(err==-1 && err==EINTR){
        perror("Cannot set the attribution of the terminal");
        return 1;
   }
   return 0;
}
int getpasswd(char* passwd, int size)
{
   int c;
   int n = 0;

   printf("Please Input password:");

   do{
      c=getchar();
      if (c != '\n'||c!='\r'){
         passwd[n++] = c;
      }
   }while(c != '\n' && c !='\r' && n < (size - 1));
   passwd[n] = '\0';
   return n;
}
int main()
{
   char *p,passwd[20],name[20];
   printf("Please Input name:");
   scanf("%s",name);
   getchar();
   set_disp_mode(STDIN_FILENO,0);
   getpasswd(passwd, sizeof(passwd));
   p=passwd;
   while(*p!='\n')
     p++;
   *p='\0';
   printf("\nYour name is: %s",name);
   printf("\nYour passwd is: %s\n", passwd);
   printf("Press any key continue ...\n");
   set_disp_mode(STDIN_FILENO,1);
   getchar();
   return 0;
}
