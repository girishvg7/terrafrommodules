#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd 
sudo echo "welcome to our instance $(hostname)" > /var/www/html/index.html