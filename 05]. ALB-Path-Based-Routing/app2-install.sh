#! /bin/bash

sudo apt-get update -y
sudo apt install nginx-core -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo echo '<h1>Hello I am Vishnu. Welcome to my world! App-2</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app2
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(15, 232, 192);"> <h1>Hello I am Vishnu. Welcome to my world!</h1> <p>Terraform Demo</p> <p>Application Version: V2</p> </body></html>' | sudo tee /var/www/html/app2/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app2/metadata.html
