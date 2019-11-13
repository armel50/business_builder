document.addEventListener("DOMContentLoaded", function() {
    var messages= $("a.messages")
    var div_mess = $("div.messages")

    var participants =  $("a.view_participants")
    var div_part = $("div.view_participants")

    var files =  $("a.files")
    var div_file = $("div.files")
    messages_to_bottom =  function(){$("div.ui.segment.scroller").scrollTop($("#messages").prop("scrollHeight"))};
    files_to_bottom =  function(){$("div.ui.segment.scroller").scrollTop($("#files").prop("scrollHeight"))};

    messages.on("click",function(){
        $(this).addClass("active")
        div_mess.removeClass(" hidden menu")
    participants.removeClass("active")
    div_part.addClass(" hidden menu")
    files.removeClass("active")
    div_file.addClass("hidden menu")


    messages_to_bottom();
    });

    participants.on("click",function(){
        $(this).addClass("active")
        div_part.removeClass(" hidden menu")
    files.removeClass("active")
    div_file.addClass(" hidden menu")
    
    messages.removeClass("active")
    div_mess.addClass(" hidden menu")
    });

    files.on("click",function(){
    $(this).addClass("active")
    div_file.removeClass("hidden menu")

    participants.removeClass("active")
    div_part.addClass(" hidden menu")

    messages.removeClass("active")
    div_mess.addClass("hidden menu")
    files_to_bottom();
    });


    $('#new_message').submit(function(e) {
    var $this, textarea;
    $this = $(this);
    textarea = $this.find('#message_content');
    if ($.trim(textarea.val()).length > 1  ) {
    if ($("input#message_attachment").get(0).files[0]){
    
        reader = new FileReader() ;
        file_name = $("input#message_attachment").get(0).files[0].name;
    
        reader.addEventListener("loadend", function() {
    
        App.global_chat.send_message(textarea.val(), $("#messages").data('chat-room-id'),reader.result,file_name);
    });
        reader.readAsDataURL($("input#message_attachment").get(0).files[0]);
        

    }else {
        App.global_chat.send_message(textarea.val(), $("#messages").data('chat-room-id'));
    }

    e.preventDefault();
        return false;
    }
            

    });
});
