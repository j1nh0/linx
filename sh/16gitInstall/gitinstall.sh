#gitinstall.sh
~/.bin/gitinstall)
 #Change directory
 echo 'cd /tmp/'&&cd /tmp/
 #IP-Tracer
 git clone https://github.com/rajkumardusad/IP-Tracer.git&&cd IP-Tracer&&bash install&&cd ..&&rm -rf IP-Tracer
 #cfg2html
 git clone https://github.com/cfg2html/cfg2html.git&&mv cfg2html/* /etc/skel/.bin/&&sync&&rm -rf cfg2html/&&chmod -R 755 /etc/skel/.bin/
 #torghost
 git clone https://github.com/SusmithKrishnan/torghost.git&&cp -Rfv torghost*/* /etc/skel/.bin/&&sync&&rm -rf torghost*
 #katoolin
 git clone https://github.com/LionSec/katoolin.git&&chmod -R 755 katoolin/&&cp -Rfv katoolin/* /etc/skel/.bin/&&sync&&rm -rf katoolin/
 #Change to home
 echo 'cd'&&cd
;;
