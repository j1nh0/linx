#!/bin/bash -
 #Variable declaration
 export C=./rcl.c
 export X86=rcl.x86_64
 export AARCH64=rcl.aarch64
 export GFLAGS='--static'
 #C program creation
 gcc -o "$X86" "$GFLAGS" "$C"
 aarch64-linux-gnu-gcc -o "$AARCH64" "$GFLAGS" "$C"
 if [ -f $X86 ];then strip --strip-all $X86;fi
 if [ -f $AARCH64 ];then aarch64-linux-gnu-strip --strip-all $AARCH64;fi
exit 0
