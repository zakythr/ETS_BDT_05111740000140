# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y

cd /tmp
curl -OL https://github.com/sysown/proxysql/releases/download/v1.4.4/proxysql_1.4.4-ubuntu16_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-common_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
curl -OL https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-client_5.7.23-1ubuntu16.04_amd64.deb

sudo apt-get install libaio1
sudo apt-get install libmecab2

sudo dpkg -i proxysql_1.4.4-ubuntu16_amd64.deb
sudo dpkg -i mysql-common_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i mysql-community-client_5.7.23-1ubuntu16.04_amd64.deb
sudo dpkg -i mysql-client_5.7.23-1ubuntu16.04_amd64.deb

sudo ufw allow 33061
sudo ufw allow 3306

sudo systemctl start proxysql
#mysql -u admin -padmin -h 127.0.0.1 -P 6032 --prompt='proxysql.sql>'
#mysql -u admin -padmin -h 127.0.0.1 -P 6032 --prompt='ProxySQLAdmin>'

#setting web server
# sudo debconf-set-selections <<< 'tzdata tzdata/Areas select Asia'
# sudo debconf-set-selections <<< 'tzdata tzdata/Zones/Asia select Jakarta'

# sudo apt update
# sudo apt install -y tzdata

# sudo apt install -y apache2 php php7.0-dom php7.0-mbstring php7.0-gd php7.0-zip \
#     php7.0-bcmath php7.0-json php7.0-mysql php7.0-pdo php7.0-intl

# cp -R /vagrant/web_server /var/www/webku

# cp /vagrant/000-default.conf /etc/apache2/sites-available/000-default.conf

# service apache2 restart