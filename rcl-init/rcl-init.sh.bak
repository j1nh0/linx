export KEY=/etc/ssh/linx.piv
export L=linx
export NULL=/dev/null
export HSSH=/home/linx/.ssh
export AKEY=/home/linx/.ssh/authorized_keys
export URL=github.com
export REPO_URL=ssh://git@github.com/j1nh0/linx.git
export PROJECT_DIR=/$L
export SHAD=/etc/shadow
export KNOWN=$HSSH/known_hosts
export RCLSERVICE=$PROJECT_DIR/rcl-init/rcl-init.service
export RCLTIMER=$PROJECT_DIR/rcl-init/rcl-init.timer
if [ $(id -u) != '0' ]||[ ! -f $KEY ]||[ ! dig +time=1 $URL &> $NULL 
then echo 'You have no root, key, or internet!'
exit 1
fi
if ! command -v git &> $NULL
then apt-get update && apt-get install -y git
fi
if id $L&>$NULL
then userdel -rf $L&>$NULL
groupdel -f $L&>$NULL
fi
useradd -m -s /bin/bash -p '!' $L
passwd -d $L &> $NULL
usermod -L $L
mkdir -p $HSSH
chown -R $L:$L $HSSH
chmod 700 $HSSH
touch $AKEY
chmod 600 $AKEY
if [ -f $KEY ]
then chown $L:$L $KEY
chmod 600 $KEY
fi
rm -rf $PROJECT_DIR
mkdir -p $PROJECT_DIR
chown $L:$L $PROJECT_DIR
if grep -q ^$L $SHAD
then ssh-keyscan -H $URL>>$KNOWN 2>$NULL
chown $L:$L $KNOWN
chmod '0644' $KNOWN
su 'linx' -s '/bin/bash' -c 'eval $(ssh-agent -s)&>$NULL
ssh-add -D&>$NULL
ssh-add /etc/ssh/linx.piv&>$NULL
git clone ssh://git@github.com/j1nh0/linx.git /linx/&>$NULL
ssh-add -D&>$NULL
eval $(ssh-agent -k)&>$NULL'
fi
find $PROJECT_DIR -type d -exec chown $L:$L {} \; -exec chmod 0775 {} \;
find $PROJECT_DIR -type f -exec chown $L:$L {} \; -exec chmod 0664 {} \;
if [ -f $RCLSERVICE ];then systemctl enable $RCLSERVICE;fi
if [ -f $RCLTIMER ];then systemctl enable $RCLTIMER;fi
