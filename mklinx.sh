#!/bin/bash -
 if [ -f ./sh.tar ];then rm -f ./sh.tar;sync;fi
 tar -cf sh.tar ./sh/;sync
####
 bash /etc/skel/.bin/gitreset
exit 0
