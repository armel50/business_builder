require "pry"
class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
     ActionCable.server.broadcast "chat_#{message.chat_room.id}_channel", render_message(message)
        # binding.pry
  end

  private

  def render_message(message)
    ApplicationController.render message
  end

end
