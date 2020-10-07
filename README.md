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
