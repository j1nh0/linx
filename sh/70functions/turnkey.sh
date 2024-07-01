#turnkey.sh
~/.bin/turnkey)
 export USAGE='USAGE: turnkey ${ p(rivate) | l(ock) | u(nloc) } ${SOME FILE} ${KEY FILE}'
 if [ ! -z $2 ];then
  export TURNKEY="$2"
  export KEY="$3"
  export ENC="$TURNKEY.enc"
  export ORIG="${TURNKEY%.*}"
  export SHA="$TURNKEY.sha256"
  case "$1" in
   p)
    case "$1" in
     
     *)echo;;
    esac
   ;;
   l)
    sha256sum "$TURNKEY">"$SHA"&&sync
    openssl enc -pbkdf2 -aes-256-cbc -in "$TURNKEY" -out "$ENC" -pass file:"$KEY"&&sync&&\
    echo -n 'encrypted and '&&rm -fv "$TURNKEY"
   ;;
   u)
    openssl enc -d -pbkdf2 -aes-256-cbc -in "$TURNKEY" -out "$ORIG" -pass file:"$KEY"&&sync
    sha256sum --check "$ORIG".sha256&&rm -fv "$TURNKEY" "$ORIG".sha256&&sync
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
 else usage;fi
;;
