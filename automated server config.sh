#!/bin/sh
# Automated Server Configuration

# Install required packages
apt-get update
apt-get install -y apache2 mysql-server php php-mysql

# Configure MySQL database
mysql -u root -e "CREATE DATABASE myapp;"
mysql -u root -e "CREATE USER 'myapp'@'localhost' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON myapp.* TO 'myapp'@'localhost';"

# Configure Apache virtual host
cat << EOF > /etc/apache2/sites-available/myapp.conf
<VirtualHost *:80>
    ServerAdmin admin@example.com
    DocumentRoot /var/www/myapp
    ServerName myapp.example.com

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
a2ensite myapp.conf
systemctl reload apache2

# Clone and configure application repository
git clone https://github.com/myapp/myapp.git /var/www/myapp
cd /var/www/myapp
cp .env.example .env
composer install
php artisan migrate --seed

# Print success message
echo "Server configuration complete!"
