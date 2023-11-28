#!/bin/bash

usage() { echo "Usage: $(basename $0) -u user -k ssh key(s)"; exit; }

while getopts ":u:k:" opt   # don't forget the colons for opts that take an arg
do
   case $opt in
     u ) user="$OPTARG" ;;
     k ) sshkey="$OPTARG" ;;
     ? ) usage ;;
  esac
done
shift $(( OPTIND - 1 ))

addgroup worker
useradd -d /home/$user -s /bin/bash -G sudo,worker -s /bin/bash $user
mkdir /home/$user /home/$user/.ssh/
echo $sshkey >> /home/$user/.ssh/authorized_keys
chown -R $user:$user /home/$user
chmod 700 /home/$user/.ssh/
chmod 600 /home/$user/.ssh/authorized_keys
service sshd restart
