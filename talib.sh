#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/talib.sh | bash -
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
sudo apt-get install -y python-pip
sudo apt-get install -y build-essential
python -m pip install --upgrade pip setuptools wheel
pip install pandas bittrex xlwt xlsxwriter
printText "Installing tools"
sudo apt-get -y install unzip wget mc htop gawk moreutils iotop
sudo npm install -g pm2
#change ssh port
printText "Changing default SSH port to 57777"
sudo curl https://raw.githubusercontent.com/dyvosvit/hello-world/master/sshd_config /etc/ssh/sshd_config
sudo service sshd restart
mkdir /opt/talib
cd /opt/talib
sudo wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar -xzf ta-lib-0.4.0-src.tar.gz
sudo tar -xzf ta-lib-0.4.0-src.tar.gz
cd ta-lib/
sudo ./configure
sudo make
sudo make install
sudo pip install cython
sudo apt-get install python-dev -y
sudo pip install TA-lib
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo curl https://rclone.org/install.sh | sudo bash
