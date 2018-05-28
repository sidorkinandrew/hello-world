#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/coinapi.sh | bash -
printText () {
  echo "&&============================================================&&"
  echo "                   $1"
  echo "&&============================================================&&"
}
printText "Updating the system"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y python-pip
sudo apt-get install -y build-essential
python -m pip install --upgrade pip setuptools wheel
pip install pandas bittrex xlwt xlsxwriter
printText "Installing tools"
sudo apt-get -y install unzip wget mc htop gawk moreutils iotop
printText "Adding swap"
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo pip install cython
sudo apt-get install python-dev -y
sudo curl https://rclone.org/install.sh | sudo bash
sudo mkdir /root/coinapi
