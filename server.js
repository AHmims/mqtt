const __EXPRESS = require("express");
const __APP = __EXPRESS();
const __SERVER = require("http").createServer(__APP);
const __PATH = require("path");
//
const __PORT = process.env.PORT || 4209;
//
__APP.use(__EXPRESS.static(__dirname));
__APP.use(__EXPRESS.static(__PATH.join(__dirname, "public")));
//
__APP.get("/", (req, res) => {
  res.sendFile(__PATH.join(__dirname, "index.js"));
});
//
var mqtt = require("mqtt");
var client = mqtt.connect();

client.on("connect", function () {
  client.subscribe("hmm/test2", function (err) {
    if (!err) {
      client.publish("hmm/test2", "Hello mqtt");
    }
  });
});

client.on("message", function (topic, message) {
  // message is Buffer
  console.log(message.toString());
  // client.end();
});
//
__SERVER.listen(__PORT, "0.0.0.0", () => {
  console.log(
    `Server started...\nListening on port ${__PORT}\nhttps://localhost:${__PORT}`
  );
});
