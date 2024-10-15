#gitsub.sh
~/.bin/gitsub)
 export USAGE='USAGE: gitsub ${ a(dd) | u(pdate) }'
 case "$1" in
  a|add)export USAGE='USAGE: gitsub add ${GIT SUBMODULE}';if [ ! -z $2 ];then git submodule add "$2";else usage;fi;;
  u|update)
   git submodule update --init --recursive
   git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'
  ;;
  *)usage;;
 esac
;;
