
#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/fock.sh | bash -
trap '' SIGINT
trap ''  SIGQUIT
trap '' SIGTSTP
GB_FDRNAME="Gunbot3.3.2"
GB_FLNAME="GUNBOT_v3.3.2_Poloniex_Bittrex_Patch"
MYPAIRS="currencies.txt"
cd /opt/
sudo wget https://github.com/GuntharDeNiro/BTCT/releases/download/$GB_FDRNAME/$GB_FLNAME.zip
sudo unzip $GB_FLNAME.zip
sudo mkdir /opt/$GB_FLNAME
sudo mkdir /opt/$GB_FLNAME/cfg
sudo cp /opt/gb-unzip-temp/gunthy-* /opt/$GB_FLNAME
sudo cp /opt/gb-unzip-temp/ALLPAIRS-params.js /opt/$GB_FDRNAME
sudo cp /opt/gb-unzip-temp/*.js /opt/$GB_FDRNAME
sudo rm /opt/gunbot
sudo ln -s /opt/$GB_FLNAME /opt/gunbot
sudo rm /opt/$GB_FLNAME.zip
sudo rm -R /opt/gb-unzip-temp
sudo chmod +x /opt/gunbot/gunthy-*
sudo echo "" > $MYPAIRS
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
