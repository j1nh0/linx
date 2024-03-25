#pipinstall.sh
~/.bin/pipinstall)
 read -r -d '' PIPINSTALL<<EOM
payload-dumper
EOM
 for PIP in "$PIPINSTALL";do sudo pip install "$PIP";done
;;
