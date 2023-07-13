####
#16ts.sh
####
ts(){
 if [ ! -z $1 ] ; then
  if [ -f $1 ] ; then
   export FILE=${1%.*}
   export EXT=${1##*.}
   mv $1 $FILE-$(date +%Y%m%d%H%M%S).$EXT
  else
   if [ -d $1 ] ; then
    export DIR=${1%/}
    mv $1 $DIR-$(date +%Y%m%d%H%M%S)/
   else
    echo 'Please verify the code in /etc/bash.bashrc, function name "Time Stamp"'
   fi
  fi
 else
  date +%Y%m%d > ./time.stamp
  date +%H:%M:%S >> ./time.stamp
  whoami >> ./time.stamp
  echo
  echo 'Stamp!'
  echo
 fi
}
####
