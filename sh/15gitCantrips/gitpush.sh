#gitpush.sh
~/.bin/gitpush)
 export USAGE='USAGE: gitpush ${ m(ain) | f(orce) }'
 case "$1" in
  m|main)git add -A;git commit -m $(date +%Y%m%d%H%M%S);git push origin main;;
  f|force)git add -A;git commit -m $(date +%Y%m%d%H%M%S);git push --force origin main;;
  usage)usage;;
  *)git add -A;git commit -m $(date +%Y%m%d%H%M%S);git push;;
 esac
;;
