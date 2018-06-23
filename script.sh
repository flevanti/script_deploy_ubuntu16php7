apt-get update
apt-get upgrade -y
# apt-get dist-upgrade
apt-get install software-properties-common
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2
add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe'
apt-get update -y
apt-get install dialog -y
apt-get install openssh-server -y
apt-get install openssh-client -y
apt-get install nano -y
apt-get install bc -y
apt-get install binutils  -y
apt-get install fop -y
apt-get install fortune -y
apt-get install memcached -y
apt-get install run-one -y
apt-get install screen -y
apt-get install sed -y
apt-get install sl -y
apt-get install rsync -y
apt-get install zip -y
apt-get install unzip -y
apt-get install xml2 -y
apt-get install python-software-properties -y
apt-get install apache2 -y
apt-get install php7.2 -y
apt-get install mysql-client-5.6 -y
apt-get install php-bz2 -y
apt-get install php-curl -y
apt-get install php-gd -y
apt-get install php-http -y
apt-get install php-igbinary -y
apt-get install php-mbstring -y
apt-get install php-mcrypt -y
apt-get install php-memcached -y
apt-get install php-msgpack -y
apt-get install php-mysql -y
apt-get install php-odbc -y
apt-get install php-propro -y
apt-get install php-raphf -y
apt-get install php-soap -y
apt-get install php-xdebug -y
apt-get install php-xml -y
apt-get install php7.2-xsl -y
apt-get install php-zip -y
apt-get install php-cli -y

a2enmod rewrite authz_groupfile headers info
systemctl restart apache2


# created catch all vhost + folder
# created php7 test vhost + folder
mkdir  /var/www/public_php7
mkdir  /var/www/html_catch_all

cp ./001-public_php7.conf /etc/apache2/sites-available/
cp ./999-default_catch_all.conf /etc/apache2/sites-available/

echo "ServerTokens Prod" | tee  /etc/apache2/conf-available/xxx-servertokens.conf
a2enconf xxx-servertokens.conf

echo "ServerSignature Off" | tee  /etc/apache2/conf-available/xxx-serversignature.conf
a2enconf xxx-serversignature.conf

echo "ServerName localhost" | tee  /etc/apache2/conf-available/xxx-fqdn-fullyqualifieddomainname.conf
a2enconf xxx-fqdn-fullyqualifieddomainname.conf
ServerName localhost   

# restart apache
apache2ctl restart

#curl -sS https://getcomposer.org/installer -o composer-setup.php
#php composer-setup.php --install-dir=/usr/local/bin --filename=composer
#rm composer-setup.php



# remember to import deploy private key and create ssh config


# change www folder owner to ubuntu
# change www folder group to www-data
chown -R ubuntu:www-data www




