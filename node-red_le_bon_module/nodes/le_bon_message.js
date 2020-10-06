module.exports = function (RED) {
  function leBonMessage(config) {
    RED.nodes.createNode(this, config);
    var node = this;
    node.on("input", function (msg) {
      msg.payload = "Hello world";
      node.send(msg);
    });
  }
  RED.nodes.registerType("le_bon_message", leBonMessage);
};
