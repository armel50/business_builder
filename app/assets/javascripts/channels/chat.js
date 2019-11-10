jQuery(document).on('turbolinks:load', function(){
  var messages;

  messages = jQuery('#messages');

   messages_to_bottom =  function(){$("div.ui.segment.scroller").scrollTop(messages.prop("scrollHeight"))};
  
    messages_to_bottom();

    return App.global_chat = App.cable.subscriptions.create({
      channel: "ChatChannel",
      chat_room_id: messages.data('chat-room-id')
    }, {
      connected: function() {console.log( messages) },
      disconnected: function() {},
      received: function(data) {  
          messages.append(data);
           $('#message_content').val("");
          messages_to_bottom();
      },
      send_message: function(message, chat_room_id,file,file_name) {
        return this.perform('send_message', {
          message: message,
          chat_room_id: chat_room_id,
          file: file,
          file_name: file_name
        });
      }
    });


});
