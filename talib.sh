#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/mysetup.sh | bash -
printText () {
  echo "&&============================================================&&"
  echo "                   $1"
  echo "&&============================================================&&"
}
printText "Updating the system"
sudo apt-get update -y && sudo apt-get upgrade -y
printText "Installing nodejs 10"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
printText "Installing tools"
sudo apt-get -y install unzip wget mc htop gawk moreutils iotop
sudo npm install -g pm2
#change ssh port
printText "Changing default SSH port to 57777"
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/sshd_config /etc/ssh/sshd_config
sudo service sshd restart

