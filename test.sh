#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/mysetup.sh | bash -
trap '' SIGINT
trap ''  SIGQUIT
trap '' SIGTSTP
GB_FDRNAME="Gunbot3.3.2"
GB_FLNAME="GUNBOT_v3.3.2_Poloniex_Bittrex_Patch"
printText () {
  echo "&&============================================================&&"
  echo "                   $1"
  echo "&&============================================================&&"
}
printText "Setup of "$GB_FDRNAME
printText "Updating the system"
sudo apt-get update
printText "Installing nodejs 7"
curl -qsL https://deb.nodesource.com/setup_7.x | bash - 
sudo apt-get -y install nodejs 
printText "Installing tools"
sudo apt-get -y install unzip wget mc htop gawk moreutils iotop
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
printText "Setup folders for GB"
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
#configs
printText "Downloading configs && scripts"
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/mypairs > /opt/gunbot/cfg/currencies.txt
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/poloniex-config.js > /opt/gunbot/cfg/poloniex-config.js
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/ALLPAIRS-params.js > /opt/gunbot/ALLPAIRS-params.js
#sudo mcedit /opt/gunbot/ALLPAIRS-params.js
#scripts
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/pair.sh > /opt/gunbot/pair.sh
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/addp > /opt/gunbot/addp
sudo chmod +x /opt/gunbot/addp
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/cln > /opt/gunbot/cln
sudo chmod +x /opt/gunbot/cln
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/prx > /opt/gunbot/prx
sudo chmod +x /opt/gunbot/prx
curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/rpl > /opt/gunbot/rpl
sudo chmod +x /opt/gunbot/rpl
cd /opt/gunbot/cfg
printText "Preparing *.yaml and configs for default pairs"
# yaml + configs
for pair in `cat ./currencies.txt| tr "\n" " "`
do
    echo "apps:">$pair.yaml
    echo "  - script : sh">>$pair.yaml
    echo "    name : '$pair'">>$pair.yaml
    echo "    args : pair.sh $pair">>$pair.yaml
    cp poloniex-config.js ../poloniex-BTC_$pair-config.js
done
#proxy download
printText "Downloading GB community proxy"
cd /opt/gunbot/
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/application.properties >/opt/gunbot/application.properties
sudo mcedit /opt/gunbot/application.properties
wget https://github.com/taniman/gunbotproxycommunity/releases/download/v0.9.6/GunbotProxyCommunity-0.9.6.jar
sudo ln -s GunbotProxyCommunity-0.9.6.jar GunbotProxyCommunity.jar
#and install
printText "Installing GB community proxy as a service"
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/gbproxy.service > /etc/systemd/system/gbproxy.service
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/gbproxy.conf > /etc/rsyslog.d/40-gbproxy.conf
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/gbproxy> /etc/logrotate.d/gbproxy
sudo touch /var/log/gbproxy.log
sudo chown syslog /var/log/gbproxy.log
sudo mkdir /var/log/gbproxy
sudo systemctl restart rsyslog
sudo echo "127.0.0.1	poloniex.com" >> /etc/hosts
sudo systemctl daemon-reload
sudo systemctl enable gbproxy.service
sudo systemctl start gbproxy
sudo systemctl status gbproxy
printText "Starting default pairs"
# run the pairs
#cd /opt/gunbot/
#for pair in `cat /opt/gunbot/cfg/currencies.txt| tr "\n" " "`
#do
#pm2 start cfg/$pair.yaml
#done
#change ssh port
printText "Changing default SSH port to 57777"
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/sshd_config /etc/ssh/sshd_config
service sshd restart
