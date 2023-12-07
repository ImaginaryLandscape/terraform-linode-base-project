#!/bin/bash

create_user() {
  useradd -d /home/$user -s /bin/bash -G sudo,worker -s /bin/bash $user
  mkdir /home/$user /home/$user/.ssh/
  echo -e $sshkey >> /home/$user/.ssh/authorized_keys
  chown -R $user:$user /home/$user
  chmod 700 /home/$user/.ssh/
  chmod 600 /home/$user/.ssh/authorized_keys
  echo "${user}:${password}" | chpasswd
  sudo chage -d 0 $user
}


oldIFS=$IFS
IFS=$'\n'
for line in $(cat /tmp/user.txt)
do
     user=$(echo $line | cut -d':' -f1)
     password=$(echo $line | cut -d':' -f2)
     sshkey=$(echo $line | cut -d':' -f3)
     create_user
done
