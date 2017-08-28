#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/test.sh | bash -
printText () {
  echo "&&============================================================&&"
  echo "                   $1"
  echo "&&============================================================&&"
}
printText "Updating the system"
sudo apt-get update
printText "Installing nodejs 7"
curl -qsL https://deb.nodesource.com/setup_7.x | bash - 
sudo apt-get -y install nodejs 
printText "Installing tools"
sudo apt-get -y install unzip wget mc htop gawk moreutils iotop
sudo npm install -g pm2 gunbot-monitor
sudo echo "" >> ~/.bashrc
sudo echo "# GUNBOT's ALIASES" >> ~/.bashrc
sudo echo "alias gbdir='cd /opt/gunbot'" >> ~/.bashrc
sudo echo "alias gbmon='pm2 monit'" >> ~/.bashrc
sudo echo "alias gbl='pm2 l'" >> ~/.bashrc
sudo echo "alias gblog='pm2 logs'" >> ~/.bashrc
sudo echo "alias gbstart='pm2 start'" >> ~/.bashrc
sudo echo "alias gbstop='pm2 stop'" >> ~/.bashrc
sudo echo "alias gbdel='pm2 delete'" >> ~/.bashrc
sudo echo "alias pairs='mcedit /opt/gunbot/cfg/currencies.txt'" >> ~/.bashrc
sudo echo "alias api='mcedit /opt/gunbot/ALLPAIRS-params.js'" >> ~/.bashrc
sudo mkdir /root/.pm2 -p
sudo chmod g+rwx /root/.pm2
sudo chmod g+rw /root/.pm2/*
sudo echo 'SELECTED_EDITOR="/usr/bin/mcedit"'>~/.selected_editor
