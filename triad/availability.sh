#!/bin/bash -
 case $(hostname) in
  septisol)
   for FORAPTINSTALL in dnsmasq dnsmasq-base dnsmasq-utils;do
   if [[ $(dpkg -l $FORAPTINSTALL) != '0' ]];then
    DEBIAN_FRONTEND=noninteractive apt-get install -y "$FORAPTINSTALL"
   fi
   done
   sed -i 's/#DNSMASQ_EXCEPT=\"lo\"/DNSMASQ_EXCEPT=\"lo\"/g' /$ETC/$DEFAULT/$DNSMASQ
   iptables -F;iptables -t $NAT -F
   iptables -t $NAT -A $POSTROUTING -o $WLAN0 -j $MASQUERADE
   iptables -A $FORWARD -i $WLAN0 -m $STATE --state $RELATED,$ESTABLISHED -j $ACCEPT
   iptables -A $FORWARD -i $ETH0 -o $WLAN0 -j $ACCEPT
   echo '1'>/$PROC/$SYS/$NET/$IPV4/$IPFORWARD
   sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /$ETC/$SYSCTL.$CONF
   systemctl $STOP $DNSMASQSERVICE
   echo -e 'interface=eth0\nbind-interfaces\nserver=1.1.1.1\ndomain-needed\nbogus-priv'>/$ETC/$DNSMASQD/$DNSMASQ.$CONF
   systemctl $START $DNSMASQSERVICE
   date>>/$ETC/$BACON.$SERVICE.$LOG
  ####
   cat << EOF > /etc/netplan/01-septisol.yaml
network:
version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses: [10.10.10.5/30]
EOF
   chmod 0600 /etc/netplan/01-septisol.yaml&&netplan apply
  ;;
  *)echo 'No special availability tasks for this host.';;
 esac
exit 0
