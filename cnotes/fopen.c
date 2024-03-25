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
#define EQ ==
#define NE !=
#define GT >
#define LT <
#define GE >=
#define LE <=
#define PI 3.14159
#define EVER ;;
#define ECHOFLAGS (ECHO | ECHOE | ECHOK | ECHONL)
int main(int argc,char *argv[]){
    FILE * fPtr;
    char buffer[BUFFER_SIZE];
    int totalRead = 0;
    fPtr = fopen("data/file2.txt", "r");
    if(fPtr == NULL){
        printf("Unable to open file.\n");
        printf("Please check whether file exists and you have read privilege.\n");
        exit(EXIT_FAILURE);
    }
    printf("File opened successfully. Reading file contents line by line. \n\n");
    while(fgets(buffer, BUFFER_SIZE, fPtr) != NULL) 
    {
        totalRead = strlen(buffer);
        buffer[totalRead - 1] = buffer[totalRead - 1] == '\n' 
                                    ? '\0' 
                                    : buffer[totalRead - 1];
        printf("%s\n", buffer);
    }
    fclose(fPtr);
    return 0;
}
char * buffer = 0;
long length;
FILE * f = fopen ("key.piv", "rb");
if(f){
  fseek (f, 0, SEEK_END);
  length = ftell (f);
  fseek (f, 0, SEEK_SET);
  buffer = malloc (length);
  if (buffer)
  {
    fread (buffer, 1, length, f);
  }
  fclose (f);
}

if (buffer)
{
  // start to process your data / extract strings here...
}
 return(0);
};
