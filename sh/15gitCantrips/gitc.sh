#gitc.sh
~/.bin/gitc)
 export USAGE='USAGE: gitc ${GIT REPO}';if [ ! -z $1 ];then git clone -j$(nproc --ignore=2) --recurse-submodules "$1";else usage;fi
;;
