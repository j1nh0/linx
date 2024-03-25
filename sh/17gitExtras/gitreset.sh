#gitreset.sh
~/.bin/gitreset)
 rm -rf ./.git/
 if\
  [ ${PWD##*/} != 'j1nh0' ] &&\
  [ ${PWD##*/} != 'nisol_ssh' ] &&\
  [ ${PWD##*/} != 'nisol_https' ] &&\
  [ ${PWD##*/} != 'j1nh0_key' ]\
 ;then
  tree --du -h > README.md
 fi
 if [ ${PWD##*/} != 'git' ];then remove e;remove s;pdfreduce;fi
 if [ "$1" == 'large' ] && [ ${PWD##*/} != 'git' ];then find . -type f -size +48M -exec te {} \;;fi
 if [ ${PWD##*/} != 'git' ];then find . -type d -exec chmod 755 {} \;;fi
 if [ ${PWD##*/} != 'git' ];then find . -type f -exec chmod 644 {} \;;fi
 if [ ${PWD##*/} != 'git' ];then find . -type d -exec chown $(whoami):$(whoami) {} \;;fi
 if [ ${PWD##*/} != 'git' ];then find . -type f -exec chown $(whoami):$(whoami) {} \;;fi
 git init
 git branch -m main
 git remote add origin "ssh://git@github.com/j1nh0/${PWD##*/}.git"
 git add -A
 git commit -m $(date +%Y%m%d%H%M%S)
 git push -f -v origin main
;;
