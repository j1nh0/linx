#gitprune.sh
~/.bin/gitprune)
 git gc --aggressive --prune=now
 git repack -Ad
 git prune
 git prune-packed
;;
