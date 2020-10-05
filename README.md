## mosquitto.conf

listener 1883
protocol mqtt

listener 9001
protocol websockets

## Start mosquitto server

C:\Program Files\mosquitto> .\mosquitto -v -c ./mosquitto.conf
