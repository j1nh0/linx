#reposync.sh
~/.bin/reposync)
 case "$1" in
  s|slow)repo sync -j1 --fail-fast;;
  *)repo sync -j$NPROC --force-sync -c;;
 esac
;;

