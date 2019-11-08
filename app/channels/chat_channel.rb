require "pry"
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def send_message(data)
   
    if !data["file"].empty?
      binding.pry
      current_user.messages.create!(content: data['message'], chat_room_id: data['chat_room_id'], file: data["file"] )

    else
      current_user.messages.create!(content: data['message'], chat_room_id: data['chat_room_id']) 
    end
  end
end
