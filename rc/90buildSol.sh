####
#90buildSol.sh
####
bldsol(){
 #i=0
 i=0
 #Test privilidges
 if [ $(id -u) != '0' ];then
  echo 'Please try again as root!'
  echo 'Or try contacting your system administrator!'
  echo 'Please rerun as root!'
  exit 1
 fi
 #Time stamp system
 echo -e "\nWHOAMI: $(whoami)\n\nPWD: $PWD\n\n$(date)">'/etc/time.stamp'
 #mkdir -vp /etc/skel/.bin/
 mkdir -vp /etc/skel/.bin/;errchk
 #chmod 755 /etc/skel/.bin/
 chmod 755 /etc/skel/.bin/;errchk
 #chown root:root /etc/skel/.bin/
 chown root:root /etc/skel/.bin/;errchk
 #wget -O "/etc/skel/.bin/j1nh0" https://github.com/j1nh0/linx/raw/main/j1nh0
 wget -O "/etc/skel/.bin/j1nh0" https://github.com/j1nh0/linx/raw/main/j1nh0;errchk
 #chmod 755 "/etc/skel/.bin/j1nh0"
 chmod 755 "/etc/skel/.bin/j1nh0";errchk
 #cd /etc/skel/.bin/
 cd /etc/skel/.bin/;errchk
 #./j1nh0
 ./j1nh0;errchk
 #wget -O "/etc/skel/.bashrc" https://raw.githubusercontent.com/j1nh0/linx/main/.bashrc
 wget -O "/etc/skel/.bashrc" https://raw.githubusercontent.com/j1nh0/linx/main/.bashrc;errchk
 #source /etc/skel/.bashrc
 source /etc/skel/.bashrc;errchk
 #skel
 skel;errchk
 #freshenup
 freshenup;errchk
 #cd /tmp/
 cd /tmp/;errchk
 #aptu
 aptu;errchk
 #aptdi
 aptdi;errchk
 #aptrepo
 aptrepo;errchk
 #aptinstall
 aptinstall;errchk
 #aptanydesk
 aptanydesk;errchk
 #aptlibdvd-pkg
 aptlibdvd-pkg;errchk
 #aptmega
 aptmega;errchk
 #aptmssql
# aptmssql;errchk
 #aptqemu
 aptqemu;errchk
 #aptbinaries
 aptbinaries;errchk
 #aptunattended
 aptunattended;errchk
 #gitinstall
 gitinstall all;errchk
 #snapinstall
 snapinstall;errchk
 #fpinstall
 fpinstall;errchk
 #update all
 update all;errchk
 #mk dj
 mk dj;errchk
 #uftoggle
 uftoggle;errchk
 #addgroups
 addgroups;errchk
 #bleach
# bleach;errchk
 #aptnagoff
 aptnagoff
 #Exit
 echo 'Live build complete!'
 sync
}
