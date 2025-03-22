#!/bin/bash -

#HOSTNAME LOGIC
case "$HOSTNAME" in
 bacon)cd ~
  iptables -F
  iptables -t nat -F
  iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
  iptables -A FORWARD -i wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
  iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT
  echo '1'>/proc/sys/net/ipv4/ip_forward
  sed -i 's/#net.ipv4.ip_forward = 1/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf
  systemctl stop dnsmasq.service
  echo 'interface=eth0\nbind-interfaces\nserver=1.1.1.1\ndomain-needed\nbogus-priv'>/etc/dnsmasq.d/custom-dnsmasq.conf
  systemctl start dnsmasq.service
 ;;
 #FROST
 frost)
  eval $(ssh-agent -k)
  eval $(ssh-agent -s)
  ssh-add -D
  ssh-add /"$ETC"/"$SSH"/"$HOSTNAME".piv
  sshfs -o allow_other "$HOSTNAME"@10.10.11.2:/"$SAMBA"/"$SHARE" /"$SAMBA"/"$SHARE"/
  ssh-add -D
  eval $(ssh-agent -k)
 ;;
 qai|qjr|qsrepo)cd ~
  su - $(hostname) -c 'eval $(ssh-agent -k);eval $(ssh-agent -s);ssh-add -D;ssh-add /etc/ssh/$(hostname).piv'
  #mount -t cifs //10.10.11.2/samba /samba/ -o username=$(hostname),rw,password=$(echo "$ADDUSER"|sha512sum|cut -c-32|tr [:lower:] [:upper:])
 ;;
 septisol)hostname
  #su - septisol -c "mega-sync"
 ;;
 *)echo "$HOSTNAME not found!";;
esac
exit 0
