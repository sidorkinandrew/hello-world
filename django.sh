printText () {
  echo "&&============================================================&&"
  echo "                   $1"
  echo "&&============================================================&&"
}

printText "Updating the system"
sudo apt-get update -y && sudo apt-get upgrade -y

printText "Installing nodejs 10 && python modules"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y build-essential
sudo apt-get -y install curl unzip wget mc htop gawk moreutils iotop httping p7zip-full
sudo npm install -g pm2

printText "Adding swap"
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

sudo apt-get install python-dev -y
sudo curl https://rclone.org/install.sh | sudo bash
sudo apt-get install software-properties-common python-software-properties
sudo add-apt-repository ppa:jonathonf/python-3.7
sudo apt-get update -y
sudo apt-get install python3.7-dev -y
python3.7 -m pip install --upgrade setuptools wheel
python3.7 -m pip install --upgrade pip numpy pandas requests python-telegram-bot xlrd openpyxl pygsheets oauthclient ccxt certifi oauth2client xlsxwriter asyncio

sudo apt update -y
sudo apt install software-properties-common -y
sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update -y
sudo apt install -y python3.7
sudo apt install -y python3-pip
python3.7 -m pip --version
python3.7 -m pip install --upgrade pip3 setuptools wheels
python3.7 -m pip install django --user
sudo apt install python-django-common python3-django


