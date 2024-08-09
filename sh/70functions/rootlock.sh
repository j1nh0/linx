#rootlock.sh
~/.bin/rootlock)
 export USAGE='USAGE: rootlock ${l(ock)|u(nlock)}'
 case "$1" in
  l)sudo usermod -L root;;
  u)sudo usermod -U root;;
  *)usage;;
 esac
;;
