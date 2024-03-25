#reposync.sh
~/.bin/reposync)
 case "$1" in
  s|slow)repo sync -j1 --fail-fast --fetch-submodules;;
  *)
   echo -e "\nPerforming full fast sync!\n"
   repo sync -j$(nproc --ignore=2) --fetch-submodules --force-sync
  ;;
 esac
;;

