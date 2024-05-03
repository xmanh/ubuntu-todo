#!/bin/bash

PHP=${1:-php8.2}

if [ -z "$(which $PHP)" ]; then
  echo "install $PHP"
  sudo add-apt-repository -y ppa:ondrej/php
  sudo apt update
  sudo apt install -y $PHP $PHP-cli $PHP-common \
    $PHP-fpm $PHP-mysql $PHP-zip $PHP-curl $PHP-gd \
    $PHP-mbstring $PHP-xml $PHP-bcmath
  sudo update-alternatives --set php /usr/bin/$PHP
else
  echo "$PHP installed"
fi

if [ -z "$(which composer)" ]; then
  echo 'install composer'
  wget https://getcomposer.org/download/latest-stable/composer.phar
  chmod +x composer.phar
  sudo mv composer.phar /usr/local/bin/composer
else
  echo "composer installed"
fi

php -v
composer -V
