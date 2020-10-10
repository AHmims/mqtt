## mosquitto.conf

listener 1883
protocol mqtt

listener 9001
protocol websockets

## Start mosquitto server

Check if the server is runing first, if yes stop it then =>
C:\Program Files\mosquitto> .\mosquitto -v -c ./mosquitto.conf

## check for open ports

netstat

---

# GCloud ready for node-red/mosquitto

## VM image

Make sure to install the ubuntu image on instance creation

## node-red

Make sure you on root =>
sudo su
cd ../..

Install node.js/npm first :

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs

Install node-red :

sudo npm install -g --unsafe-perm node-red

## mosquitto

sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
sudo apt-get update
sudo apt-get install mosquitto
sudo apt-get install mosquitto-clients
sudo apt clean
