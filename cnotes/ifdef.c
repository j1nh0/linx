#include<stdio.h>
#include<stdlib.h>
int main(){
 void cls(){
  #ifdef _WIN32
   system("cls");
  #else
   #ifdef __linux__
    system("clear");
   #else
    #ifdef __ANDROID__
     system("clear");
    #else
     printf("\nSYSTEM NOT DETECTED!\n\n");
    #endif
   #endif
  #endif
 };
 cls();
return(0);};
