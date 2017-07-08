#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/mysetup.sh | bash -
trap '' SIGINT
trap ''  SIGQUIT
trap '' SIGTSTP
GB_FDRNAME="Gunbot3.3.2"
GB_FLNAME="GUNBOT_v3.3.2_Poloniex_Bittrex_Patch"
PAIRS_FLN_NAME ="currencies.txt"
printText () {
  echo "&&============================================================&&"
  echo "                   $1"
  echo "&&============================================================&&"
}
r() {
read -p "Input pair name without BTC_ in UPPERCASE: " str
echo '"$str" | tr "[:lower:]" "[:upper:]"' >> $PAIRS_FLN_NAME
echo "BTC_$str pair is selected"
}
printText "Setup of "$GB_FDRNAME
printText "Updating the system"
sudo apt-get update
printText "Installing nodejs 7"
curl -qsL https://deb.nodesource.com/setup_7.x | bash - 
sudo apt-get -y install nodejs 
printText "Installing tools"
sudo apt-get -y install unzip wget mc htop gawk 
sudo npm install -g pm2 gunbot-monitor 
printText "Installing "$GB_FDRNAME
cd /opt/
sudo wget https://github.com/GuntharDeNiro/BTCT/releases/download/$GB_FDRNAME/$GB_FLNAME.zip
sudo unzip $GB_FLNAME.zip -d $GB_FLNAME
sudo rm /opt/gunbot
sudo ln -s /opt/$GB_FLNAME /opt/gunbot
sudo mkdir /opt/gunbot/cfg
sudo rm /opt/gunbot/*.exe
sudo rm /opt/gunbot/gunthy-macos
sudo rm /opt/gunbot/gunthy-linuxx86
sudo rm /opt/$GB_FLNAME.zip
sudo chmod +x /opt/gunbot/gunthy-linuxx64
sudo echo "" > /opt/gunbot/cfg/$MYPAIRS
sudo echo "" >> ~/.bashrc
sudo echo "# GUNBOT's ALIASES" >> ~/.bashrc
sudo echo "alias gbdir='cd /opt/gunbot'" >> ~/.bashrc
sudo echo "alias gbmon='pm2 monit'" >> ~/.bashrc
sudo echo "alias gbl='pm2 l'" >> ~/.bashrc
sudo echo "alias gblog='pm2 logs'" >> ~/.bashrc
sudo echo "alias gbstart='pm2 start'" >> ~/.bashrc
sudo echo "alias gbstop='pm2 stop'" >> ~/.bashrc
sudo echo "alias editpairs='mcedit /opt/gunbot/cfg/currencies.txt'" >> ~/.bashrc
sudo mkdir /root/.pm2 -p
sudo chmod g+rwx /root/.pm2
sudo chmod g+rw /root/.pm2/*
# editing currencies
sudo echo 'SELECTED_EDITOR="/usr/bin/mcedit"'>~/.selected_editor
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/mypairs > /opt/gunbot/cfg/$MYPAIRS
