#include<stdio.h>
#include<unistd.h>
int main(int argc,char *argv[]){
 char *fname="test.txt";
 if(access(fname,F_OK)==0){
  printf("\n1\n");
 }else{
  printf("\n2\n");
 };
 return(0);
};
