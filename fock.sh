
#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/fock.sh | bash -
trap '' SIGINT
trap ''  SIGQUIT
trap '' SIGTSTP
TMPLDR="/opt/unzip-tmp"
GB_FDRNAME="Gunbot3.3.2"
GB_FLNAME="GUNBOT_v3.3.2_Poloniex_Bittrex_Patch"
MYPAIRS="currencies.txt"
cd /opt/
sudo wget https://github.com/GuntharDeNiro/BTCT/releases/download/$GB_FDRNAME/$GB_FLNAME.zip
sudo unzip $GB_FLNAME.zip -d $TMPLDR
sudo rm /opt/gunbot
sudo ln -s /opt/$GB_FLNAME /opt/gunbot
sudo mkdir /opt/gunbot/cfg
sudo cp $TMPLDR/gunthy-linuxx64 /opt/gunbot
sudo cp $TMPLDR/ALLPAIRS-params.js /opt/gunbot
sudo cp $TMPLDR/*.js /opt/gunbot
sudo ln -s /opt/$GB_FLNAME /opt/gunbot
#sudo rm /opt/$GB_FLNAME.zip
#sudo rm -R $TMPLDR
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
