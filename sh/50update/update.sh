#update.sh
~/.bin/update)
 cd /tmp/
 case "$1" in
  as)
   git clone https://github.com/google/adb-sync.git
   mv adb-sync/* /etc/skel/.bin/
   rm -rf adb-sync/
   cd /etc/skel/.bin/
   perm r
  ;;
  pf)
   sudo wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip -O /tmp/platform-tools-latest-linux.zip
   sudo unzip -o /tmp/platform-tools-latest-linux.zip -d /tmp/
   sudo chmod -R 755 /tmp/platform-tools/
   sudo chown -R root:root /tmp/platform-tools/
   for PF in $(ls -A /tmp/platform-tools/);do
    mv -v /tmp/platform-tools/$PF /etc/skel/.bin/
   done
   cd /etc/skel/.bin/
   perm r
  ;;
  rp)
   sudo wget https://storage.googleapis.com/git-repo-downloads/repo -O /etc/skel/.bin/repo
   sudo chmod 755 /etc/skel/.bin/repo
   cd /etc/skel/.bin/
   perm r
  ;;
  yt)
   sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /etc/skel/.bin/yt-dlp
   sudo chmod 755 /etc/skel/.bin/yt-dlp
   cd /etc/skel/.bin/
   perm r
  ;;
  lmms)
   sudo wget https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage -O /etc/skel/.bin/lmms
   sudo chmod 755 /etc/skel/.bin/lmms
  ;;
  etcher)
   sudo wget https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-1.18.11-x64.AppImage -O /etc/skel/.bin/etcher
   sudo chmod 755 /etc/skel/.bin/etcher
  ;;
  qflipper)
   sudo wget https://update.flipperzero.one/builds/qFlipper/1.3.2/qFlipper-x86_64-1.3.2.AppImage -O /etc/skel/.bin/qflipper
   sudo chmod 755 /etc/skel/.bin/qflipper
  ;;
  freecad)
   sudo wget https://github.com/FreeCAD/FreeCAD/releases/download/0.21.0/FreeCAD_0.21.0-Linux-x86_64.AppImage -O /etc/skel/.bin/freecad
   sudo chmod 755 /etc/skel/.bin/freecad
  ;;
  cura)
   sudo wget https://github.com/Ultimaker/Cura/releases/download/5.4.0/UltiMaker-Cura-5.4.0-linux.AppImage -O /etc/skel/.bin/cura
   sudo chmod 755 /etc/skel/.bin/cura
  ;;
  checkra1n)
   sudo wget https://assets.checkra.in/downloads/linux/cli/x86_64/dac9968939ea6e6bfbdedeb41d7e2579c4711dc2c5083f91dced66ca397dc51d/checkra1n -O /etc/skel/.bin/checkra1n
   sudo chmod 755 /etc/skel/.bin/checkra1n
  ;;
  unetbootin)
   sudo wget https://github.com/unetbootin/unetbootin/releases/download/702/unetbootin-linux64-702.bin -O /etc/skel/.bin/unetbootin
   sudo chmod 755 /etc/skel/.bin/unetbootin
  ;;
  openshot)
   sudo wget https://github.com/OpenShot/openshot-qt/releases/download/v3.1.1/OpenShot-v3.1.1-x86_64.AppImage -O /etc/skel/.bin/openshot
   sudo chmod 755 /etc/skel/.bin/openshot
  ;;
  godot)
   sudo wget https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_linux.x86_64.zip -O godot.zip
   unzip godot.zip
   sync
   rm godot.zip
   sudo mv Go* /etc/skel/.bin/godot
   sudo chmod 755 /etc/skel/.bin/godot
  ;;
  bcn3d)
   sudo wget https://github.com/BCN3D/Stratos/releases/download/v1.6.4/BCN3D_Stratos-1.6.4.AppImage -O /etc/skel/.bin/bcn3d
   sudo chmod 755 /etc/skel/.bin/bcn3d
  ;;
  sqlbrowser)
   sudo wget https://download.sqlitebrowser.org/DB_Browser_for_SQLite-v3.12.2-x86_64.AppImage -O /etc/skel/.bin/sqlbrowser
   sudo chmod 755 /etc/skel/.bin/sqlbrowser
  ;;
  ventoy)
   sudo wget https://github.com/ventoy/Ventoy/releases/download/v1.0.96/ventoy-1.0.96-linux.tar.gz -O ventoy.tgz
   tar -xvzf ventoy.tgz
   sync
   rm ventoy.tgz
   sudo mv ventoy*/* /etc/skel/.bin/
   rm -rf ventoy-*/
   cd /etc/skel/.bin/
   perm r
  ;;
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
   update checkra1n;errchk
   update unetbootin;errchk
   update openshot;errchk
   update godot;errchk
   update bcn3d;errchk
   update sqlbrowser;errchk
   update ventoy;errchk
  ;;
  *)echo 'USAGE: update ${as|pf|rp|yt|lmms|etcher|qflipper|freecad|cura|checkra1n|unetbootin|openshot|godot|bcn3d|sqlbrowser|ventoy|all}';;
 esac
;;
