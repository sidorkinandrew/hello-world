apt-get install curl -y
sudo apt-get -y install curl unzip wget mc htop gawk moreutils iotop httping p7zip-full
sudo echo 'SELECTED_EDITOR="/usr/bin/mcedit"'>~/.selected_editor

sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

mkdir downloads
cd downloads
wget https://www.apachefriends.org/xampp-files/7.4.6/xampp-linux-x64-7.4.6-0-installer.run
chmod +x ./xampp-linux-x64-7.4.6-0-installer.run
./xampp-linux-x64-7.4.6-0-installer.run

cd /opt/lampp/htdocs/
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

ps aux | egrep '(apache|httpd)'
chown -R daemon /var/www/html/

# define( 'FS_METHOD', 'direct' );

sudo ln -s /opt/lampp/lampp /etc/init.d/lampp

# mcedit /opt/lampp/etc/httpd.conf
Listen xxx.xxx.xxx.xxx:xxxxxxx

# mcedit /opt/lampp/etc/extra/httpd-xampp.conf
<Directory "/opt/lampp/phpmyadmin">
    AllowOverride AuthConfig Limit
#    Require local
#    ErrorDocument 403 /error/XAMPP_FORBIDDEN.html.var
    Order allow,deny
    Allow from xxx.xxx.xxx.xxx
    Require all granted
</Directory>

