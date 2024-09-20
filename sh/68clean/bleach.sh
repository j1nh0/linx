#bleach.sh
~/.bin/bleach)
 for BLEACH in $(bleachbit --list-cleaners|grep -v 'free_disk_space'|grep -v 'memory');do bleachbit --clean --overwrite "$BLEACH";sync;done
;;
