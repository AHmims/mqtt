module.exports = function (RED) {
  function leRandomNumber(config) {
    RED.nodes.createNode(this, config);
    var node = this;
    node.on("input", function (msg) {
      msg.payload = Math.random();
      node.send(msg);
    });
  }
  RED.nodes.registerType("le_random_number", leRandomNumber);
};
