#mirror.sh
~/.bin/mirror)
 export USAGE='USAGE: mirror ${ i(so) | m(erge) | o(utline) | s(hip) | w(ebsite) }'
 case "$1" in
  i|iso)rsync --archive --progress --human-readable --whole-file --acls --no-perms --inplace /iso/ /j1nh0/;sync;;
  m|merge)export USAGE='USAGE: merge ${SOURCE} ${DESTINATION}';if [ ! -z $3 ];then rsync --archive --progress --human-readable --whole-file --inplace --exclude=.* --exclude=studio --exclude=sdk "$2" "$3";else usage;fi;sync;;
  o|outline)export USAGE='USAGE: outline ${SOME OTHER DIR}';if [ ! -z $2 ];then tree -dfi --noreport .|cut -c3-|xargs -I{} mkdir -vp "$2{}";else usage;fi;sync;;
  s|ship)export USAGE='USAGE: ship ${SOURCE} ${DESTINATION}';if [ ! -z $3 ];then rsync --archive --progress --human-readable --whole-file --remove-source-files --acls --no-perms --inplace --exclude=.* --exclude=studio --exclude=sdk "$2" "$3";else usage;fi;sync;;
  w|website)export USAGE='USAGE: wmirror ${WEBSITE}';if [ ! -z $2 ];then wget --random-wait -e robots=off --no-parent --page-requisites --mirror --convert-links --continue --recursive --user-agent='RIPPER PLUGIN' --show-progress "$2";else usage;fi;sync;;
  usage)usage;;
  *)export USAGE='USAGE: mirror ${SOURCE} ${DESTINATION}';if [ ! -z $2 ];then rsync --archive --progress --human-readable --whole-file --delete --acls --no-perms --inplace "$1" "$2";else usage;fi;sync;;
 esac
;;
