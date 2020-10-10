## mosquitto.conf

listener 1883
protocol mqtt

listener 9001
protocol websockets

## Start mosquitto server

Check if the server is runing first, if yes stop it then =>
C:\Program Files\mosquitto> .\mosquitto -v -c ./mosquitto.conf

## check for open ports

(WINDOWS)
netstat
(LINUX)
sudo lsof -i -P -n | grep LISTEN

## Enable firewall / configure ports

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04

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

---

# A problem that took 3 hours to solve

websocket not accecible remotly, what to do ? Enable it.

what I did =>

ufc
iptables

results => port is opened but still not accecibl remotly. | this will work if the machine was not runing on a cloud service such as gcloud/aws

solution => https://stackoverflow.com/a/62814273 thanks stranger 😙
