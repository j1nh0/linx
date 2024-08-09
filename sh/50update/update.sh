#update.sh
~/.bin/update)
 cd /tmp/
 export SKELBIN=/etc/skel/.bin/
 case "$1" in
  as|adb-sync)cd /tmp/&&git clone https://github.com/google/adb-sync.git&&cp -Rfv adb-sync/* "$SKELBIN";;
  pf|platform-tools)cd /tmp/&&wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip&&unzip -o platform-tools-latest-linux.zip&&cp -Rfv platform-tools/* "$SKELBIN";;
  rp|repo)wget https://storage.googleapis.com/git-repo-downloads/repo -O "$SKELBIN"repo;;
  yt|yt-dlp)wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O "$SKELBIN"yt-dlp;;
  lmms)wget https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage -O "$SKELBIN"lmms;;
  etcher)wget https://github.com/balena-io/etcher/releases/download/v1.19.22/balenaEtcher-1.19.22-x64.AppImage -O "$SKELBIN"etcher;;
  qflipper)wget https://update.flipperzero.one/builds/qFlipper/1.3.3/qFlipper-x86_64-1.3.3.AppImage -O "$SKELBIN"qflipperr;;
  freecad)wget https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage -O "$SKELBIN"freecad;;
  cura)wget https://github.com/Ultimaker/Cura/releases/download/5.7.2-RC2/UltiMaker-Cura-5.7.2-linux-X64.AppImage -O "$SKELBIN"cura;;
  unetbootin) wget https://github.com/unetbootin/unetbootin/releases/download/702/unetbootin-linux64-702.bin -O "$SKELBIN"unetbootin;;
  openshot) wget https://github.com/OpenShot/openshot-qt/releases/download/v3.2.1/OpenShot-v3.2.1-x86_64.AppImage -O "$SKELBIN"openshot;;
  godot)cd /tmp/&&wget https://github.com/godotengine/godot/releases/download/4.2.2-stable/Godot_v4.2.2-stable_linux.x86_64.zip -O godot.zip&&mv Go* "$SKELBIN"godot;;
  sqlbrowser)wget https://download.sqlitebrowser.org/DB_Browser_for_SQLite-v3.12.2-x86_64.AppImage -O "$SKELBIN"sqlbrowser;;
  arduino)wget https://downloads.arduino.cc/arduino-ide/arduino-ide_latest_Linux_64bit.AppImage -O "$SKELBIN"arduino;;
  bitwarden)
   wget 'https://vault.bitwarden.com/download/?app=desktop&platform=linux' -O "$SKELBIN"bitwarden
   wget 'https://vault.bitwarden.com/download/?app=cli&platform=linux' -O "$SKELBIN"bitwardencli
  ;;
  upscayl)wget https://github.com/upscayl/upscayl/releases/download/v2.11.5/upscayl-2.11.5-linux.AppImage -O "$SKELBIN"upscayl;;
  minimal)
   update as;errchk
   update pf;errchk
   update rp;errchk
   update yt;errchk
  ;;
  all)
   update as;errchk
   update pf;errchk
   update rp;errchk
   update yt;errchk
   update lmms;errchk
   update etcher;errchk
   update qflipper;errchk
   update freecad;errchk
   update cura;errchk
   update unetbootin;errchk
   update openshot;errchk
   update godot;errchk
   update sqlbrowser;errchk
   update arduino;errchk
   update bitwarden;errchk
   update upscayl;errchk
  ;;
  *)echo -e "\nUSAGE:\n\nupdate\n\tas\n\tpf\n\trp\n\tyt\n\tlmms\n\tetcher\n\tqflipper\n\tfreecad\n\tcura\n\tunetbootin\n\topenshot\n\tgodot\n\tsqlbrowser\n\tarduino\n\tbitwarden\n\tupscayl\n\tall\n\tminimal\n\t\t->adb-sync\n\t\t->platform-tools\n\t\t->repo\n\t\t->yt-dlp";;
 esac
 cd //etc/skel/.bin/;perm r
;;
