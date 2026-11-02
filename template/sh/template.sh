#!/bin/bash -
#VARIABLE DECLARE
if [ -f $HOME/.linx/etc/environment ];then source $HOME/.linx/etc/environment;else echo 'Environment not found!';exit 1;fi
if [ -f $HOME/.linx/etc/array ];then source $HOME/.linx/etc/array;else echo 'Array not found!';exit 1;fi
export USAGE='USAGE: '
#FUNCTION DECLARE
(){
 
};
#MAIN LOGIC
;sync;
#MAIN EXIT
exit 0
