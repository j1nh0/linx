#perm.sh
~/.bin/perm)
 export USAGE='USAGE: perm ${p(dir-755/file-644)|r(755)|s(700)|u(777)} .'
 case "$1" in
  p)export FPERM=644;export DPERM=755;;
  r)export FPERM=755;export DPERM=755;;
  s)export FPERM=700;export DPERM=700;;
  u)export FPERM=777;export DPERM=777;;
  *)usage;exit 1;;
 esac
 find . -type d -exec chmod "$DPERM" {} \;
 find . -type f -exec chmod "$FPERM" {} \;
 find . -type d -exec chown $(whoami):$(whoami) {} \;
 find . -type f -exec chown $(whoami):$(whoami) {} \;
;;
