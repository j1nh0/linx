#turnkey.sh
~/.bin/turnkey)
 export USAGE='USAGE: turnkey ${l(ock)|u(nloc)} ${KEY FILE}'
 if [ ! -z $2 ];then
  export KEY="$2"
  remove s
  pdfreduce
  for TURNKEY in $(find . -type f ! '(' -name 'LICENSE' -o -name 'README.md' -o -name '.git' -o -wholename '.' ')' -not -path "./.git/*");do
   export ENC="$TURNKEY.enc"
   export ORIG="${TURNKEY%.*}"
   export SHA="$TURNKEY.sha256"
   case "$1" in
    l)
     sha256sum "$TURNKEY">"$SHA"&&sync
     openssl enc -pbkdf2 -aes-256-cbc -in "$TURNKEY" -out "$ENC" -pass file:"$KEY"&&sync&&\
     echo -n 'encrypted and '&&rm -fv "$TURNKEY"
    ;;
    u)
     openssl enc -d -pbkdf2 -aes-256-cbc -in "$TURNKEY" -out "$ORIG" -pass file:"$KEY"&&sync
     sha256sum --check "$ORIG".sha256
#     if [ "$?" == '0' ];then
#      echo -n 'decrypted and '&&\
#      rm -fv "$TURNKEY"&&\
#      rm -fv "$ORIG".sha256
#     else
#      echo 'Checksum mismatch!'
#      read NULLVAR
#     fi
    ;;
    *)usage;;
   esac
  done
 else usage;fi
;;
