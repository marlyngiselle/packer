sleep 30
sudo apt update
sudo apt install -y nginx
systemctl start nginx
systemctl enable nginx
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
