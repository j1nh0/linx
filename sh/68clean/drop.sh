#drop.sh
~/.bin/drop)
 for INT in $(seq 1 3);do sudo echo "$INT">/proc/sys/vm/drop_caches;sync;done
;;
