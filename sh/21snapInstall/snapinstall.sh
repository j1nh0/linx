#snapinstall.sh
~/.bin/snapinstall)
 read -r -d '' SNAPINSTALL<<EOM
signal-desktop
kompozer
p7zip-desktop
EOM
 for SNAP in "$SNAPINSTALL";do sudo snap install "$SNAP";done
;;
