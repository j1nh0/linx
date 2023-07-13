####
#14gcc.sh
####
#GCC Compile Object
gco(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Compile Static
gcs(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1 --static
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Object
gxo(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  aarch64-linux-gnu-gcc -o $PROGRAM $1
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Static
gxs(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  aarch64-linux-gnu-gcc -o $PROGRAM $1 --static
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Object 32 bit
gxo32(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  arm-linux-gnueabi-gcc -o $PROGRAM $1
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC Cross-Compile Static 32 bit
gxs32(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  arm-linux-gnueabi-gcc -o $PROGRAM $1 --static
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC GDB symbols added
gdo(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1 -ggdb
 else
  echo 'Please provide a program to compile!'
 fi
}
#GCC GDB symbols added static
gds(){
 if [ ! -z $1 ];then
  export PROGRAM="${1%.*}"
  gcc -o $PROGRAM $1 --static -ggdb
 else
  echo 'Please provide a program to compile!'
 fi
}
####
