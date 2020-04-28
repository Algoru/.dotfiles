#!/bin/sh

if [ $(id -u) -ne 0 ]
then
    echo "[!] Only root may install the LAMP server."
    exit 1
fi

function install_fedora ()
{
    echo "[¡] Updating repositories..."
    dnf update -y
    echo "[¡] Done. Installing httpd..."
    dnf install -y httpd
    echo "[¡] Done. Installing MariaDB..."
    dnf install -y mariadb mariadb-server
    echo "[¡] Done. Let's configurate it!"
    mysql_secure_installation
    echo "[¡] Great. Installing PHP v7..."
    dnf install -y php php-cli php-php-gettext php-mbstring php-mcrypt php-mysqlnd php-pear php-curl php-gd php-xml php-bcmath php-zip
    echo "[¡] Done. I'm restarting everything..."
    systemctl restart httpd
    systemctl restart mariadb
    echo "[¡] Writing test file..."
    echo "<?php phpinfo(); ?>" > /var/www/html/index.php
    echo "[¡] Done. Go to http://localhost/ and check that everything was setup correctly."
}

DIST_NAME=$(cat /etc/*-release|grep -m 1 NAME= | cut -d'=' -f2)

case $DIST_NAME in
    "Fedora")
        install_fedora
    ;;
    "Ubuntu")
        echo "Ubuntu!"
    ;;
    *)
        echo "Hey, what new distro are you trying?"
        exit 1
    ;;
esac
