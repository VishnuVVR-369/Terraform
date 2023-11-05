#! /bin/bash

sudo apt-get update -y
sudo apt install nginx-core -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo echo '<h1>Hello I am Vishnu. Welcome to my world!</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/api
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Hello I am Vishnu. Welcome to my world!</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/api/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/api/metadata.html
