/*
20230418101648
openfile.c
*/
//Standard includes
#include<assert.h>
#include<ctype.h>
#include<errno.h>
#include<math.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<termios.h>
#include<time.h>
#include<unistd.h>
//Definitions for humans
#define EQ ==
#define NE !=
#define GT >
#define LT <
#define GE >=
#define LE <=
#define PI 3.14159
#define EVER ;;
#define ECHOFLAGS (ECHO | ECHOE | ECHOK | ECHONL)
//Standard main
int main(int argc,char *argv[]){
 //Initialization
 int i,j,k;
 FILE* ptr;
 char ch;
 // Opening file in reading mode
 ptr=fopen("key.piv","r");
 if(NULL==ptr){
  printf("file can't be opened \n");
 };
 while(ch!=EOF){
  ch=fgetc(ptr);
  printf("%c",ch);
 };
 // Closing the file
 fclose(ptr);
 //Main return
 return(0);
};
