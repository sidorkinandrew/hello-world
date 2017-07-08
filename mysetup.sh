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
