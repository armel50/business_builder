require "pry"
class MessagesController < ApplicationController

#     chat_room_messages GET    /chat_rooms/:chat_room_id/messages(.:format)                                             messages#index
#     POST   /chat_rooms/:chat_room_id/messages(.:format)                                             messages#create
# new_chat_room_message GET    /chat_rooms/:chat_room_id/messages/new(.:format)                                         messages#new
# edit_chat_room_message GET    /chat_rooms/:chat_room_id/messages/:id/edit(.:format)                                    messages#edit
# chat_room_message GET    /chat_rooms/:chat_room_id/messages/:id(.:format)                                         messages#show
#     PATCH  /chat_rooms/:chat_room_id/messages/:id(.:format)                                         messages#update
#     PUT    /chat_rooms/:chat_room_id/messages/:id(.:format)                                         messages#update
#     DELETE /chat_rooms/:chat_room_id/messages/:id(.:format)                                         messages#destroy

    def create 
        @message = Message.new(message_params)
        @message.user = found_user

        @message.chat_room = found_chat_room
        @chat_room = found_chat_room 
        # binding.pry
        @department = @chat_room.department
        if @message.save 
            @chat_room.messages << @message 
            found_user.messages << @message 
            # binding.pry
        else 
            flash[:notice] = "Message can't be blank"
        end
        
        redirect_to department_chat_room_path(@department,@chat_room)
    end 

    def destroy 
        @chat_room = found_chat_room 
        @message = Message.find_by(id: params[:id])
        @message.delete 
        redirect_to department_chat_room_path(@chat_room.department,@chat_room)
    end

    private 
    def found_user 
        User.find_by(id: session[:user_id])
    end

    def found_chat_room 
        ChatRoom.find_by(id: params[:chat_room_id])
    end

    def message_params 
        params.require(:message).permit(:content)
    end
end
