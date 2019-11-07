App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log("heeeeeyyyy");
  },
  disconnected: function() {},
  received: function(data) {
    var messages = $(".chatbox");
    messages.append(data["message"]);
    messages.scrollTop(messages[0].scrollHeight);
  }
});