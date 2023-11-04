#!/bin/bash

echo 'install PHP8.1'

sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install -y php8.1 php8.1-cli php8.1-common \
  php8.1-fpm php8.1-mysql php8.1-zip php8.1-curl php8.1-gd \
  php8.1-mbstring php8.1-xml php8.1-bcmath

echo 'install composer'

wget https://getcomposer.org/download/latest-stable/composer.phar
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer

php -v
composer -v
