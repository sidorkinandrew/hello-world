#!/bin/bash
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
echo "$str" | tr "[:lower:]" "[:upper:]" >> $PAIRS_FLN_NAME
echo "BTC_$str pair is selected"
}
printText "Setup of "$GB_FDRNAME
printText "Updating the system"
apt-get -qq update > /dev/null 2>&1
apt-get -y -qq install curl  > /dev/null 2>&1
printText "Installing nodejs 7"
curl -qsL https://deb.nodesource.com/setup_7.x | bash - > /dev/null 2>&1
apt-get -y -qq install nodejs > /dev/null 2>&1
printText "Installing tools"
apt-get -y -qq unzip install wget mc htop gawk > /dev/null 2>&1
npm install -g pm2 gunbot-monitor > /dev/null 2>&1
printText "Installing "$GB_FDRNAME
wget -q https://github.com/GuntharDeNiro/BTCT/releases/download/${GB_FDRNAME}/${GB_FLNAME}.zip -P /opt/
unzip -o -qq /opt/${GB_FLNNAME}.zip -d /opt/gb-unzip-temp
mkdir /opt/${GB_FLNAME} -p
mkdir /opt/${GB_FLNAME}/cfg -p
cp /opt/gb-unzip-temp/gunthy-* /opt/${GB_FLNAME}
cp /opt/gb-unzip-temp/ALLPAIRS-params.js /opt/${GB_FLNAME}
cp /opt/gb-unzip-temp/*.js /opt/${GB_FLNAME}
rm /opt/gunbot > /dev/null 2>&1
ln -s /opt/${GB_FLNAME} /opt/gunbot
rm /opt/${GB_FLNAME}.zip
rm -R /opt/gb-unzip-temp
chmod +x /opt/gunbot/gunthy-*
printText "Setting up GUNBOT's folder"
echo "" > $PAIRS_FLN_NAME
echo "" >> ~/.bashrc
echo "# GUNBOT's ALIASES" >> ~/.bashrc
echo "alias gbdir='cd /opt/gunbot'" >> ~/.bashrc
echo "alias gbmon='pm2 monit'" >> ~/.bashrc
echo "alias gbl='pm2 l'" >> ~/.bashrc
echo "alias gblog='pm2 logs'" >> ~/.bashrc
echo "alias gbstart='pm2 start'" >> ~/.bashrc
echo "alias gbstop='pm2 stop'" >> ~/.bashrc
echo "alias editpairs='mcedit /opt/gunbot/cfg/currencies.txt'" >> ~/.bashrc
mkdir /root/.pm2 -p
chmod g+rwx /root/.pm2
chmod g+rw /root/.pm2/*
# editing currencies
printText "Configuring "$GB_FDRNAME
echo 'SELECTED_EDITOR="/usr/bin/mcedit"'>~/.selected_editor
#echo "# Enter pairs you want to start here"
#echo "# without BTC_, just names "
#echo "# only uppercase, please "
#echo "# separate each coinname using enter "
#echo "# when ready hit enter "
#mcedit /opt/gunbot/cfg/currencies.txt

#basic ssh protection 

# display message and pause 
#pause(){#
#	local m="$@"
#	echo "$m"
#	read -p "Press [Enter] key to continue..." key
#}#
 
# set an 
#while :
#do
	# show menu
#	clear
#	echo "---------------------------------"
#	echo "	     M A I N - M E N U"
#	echo "---------------------------------"
#	echo "1. Show current date/time"
#	echo "2. Show what users are doing"
#	echo "3. Show top memory & cpu eating process"
#	echo "4. Show network stats"
#	echo "5. Exit"
#	echo "---------------------------------"
#	read -r -p "Enter your choice [1-5] : " c
	# take action
#	case $c in
#		1) pause "$(date)";;
#		2) w| less;;
#		3) echo '*** Top 10 Memory eating process:'; ps -auxf | sort -nr -k 4 | head -10; 
#		   echo; echo '*** Top 10 CPU eating process:';ps -auxf | sort -nr -k 3 | head -10; 
#		   echo;  pause;;
#		4) netstat -s | less;;
#		5) break;;
#		*) Pause "Select between 1 to 5 only"
#	esac
#d#one
