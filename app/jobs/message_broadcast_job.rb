class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast "chat_channel", {
      message: render_message(message)
    }
  end

  private 
  def render_message(message)
    ChatRoomsController.render (
    {partial: "chat_rooms/partials",
      locals: {
        message: message
      }
    }
    )
  end
end
