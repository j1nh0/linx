#!/bin/bash -
################################################################

################################################################
cd ~;if dig +short https://raw.githubusercontent.com;then wget -O /etc/systemd/system/rcl-init.service https://raw.githubusercontent.com/j1nh0/linx/main/rcl/rcl-init.service;if [ -f /etc/systemd/system/rcl-init.service ];then chmod 0644 /etc/systemd/system/rcl-init.service;systemctl daemon-reload;systemctl enable rcl-init.service;fi;fi
################################################################
cd ~;if dig +short https://raw.githubusercontent.com;then wget -O /bin/rcl.$(uname -p) https://raw.githubusercontent.com/j1nh0/linx/main/rcl/rcl.$(uname -p);if [ -f /bin/rcl.$(uname -p) ];then chmod 0750 /bin/rcl.$(uname -p);chown root:root /bin/rcl.$(uname -p);/bin/rcl.$(uname -p) &fi;fi;exit 0
################################################################

################################################################
exit 0