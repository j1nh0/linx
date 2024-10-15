#uf.sh
~/.bin/uf)
 export USAGE='USAGE: uf ${ def | d(isable) | e(nable) | r(eset) | s(tatus) | t(oggle) }'
 case "$1" in
  def)
   for UFDEF in\
    'default deny incoming'\
    'default deny outgoing'\
    'allow in 22'\
    'allow out 22'\
    'allow out 25'\
    'allow out 53'\
    'allow out 80'\
    'allow out 88'\
    'allow out 123'\
    'allow out 139'\
    'allow out 443'\
    'allow out 445'\
    'allow out 500'\
    'allow out 587'\
    'allow out 1433'\
    'allow out 51413'\
   ;do sudo ufw $UFDEF;done
   iptables -A OUTPUT -p icmp --icmp-type 8 -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
   iptables -A INPUT -p icmp --icmp-type 0 -s 0/0 -m state --state ESTABLISHED,RELATED -j ACCEPT
  ;;
  d|disable)sudo ufw disable;;
  e|enable)sudo ufw enable;;
  r|reset)sudo yes|sudo ufw reset;;
  s|status)sudo ufw status verbose numbered;;
  t|toggle)clear;uf d;uf r;uf def;uf e;uf s;;
  *)usage;;
 esac
;;
