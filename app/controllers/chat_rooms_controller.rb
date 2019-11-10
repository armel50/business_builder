require("pry")
class ChatRoomsController < ApplicationController

#     department_chat_rooms GET    /department/:department_id/chat_rooms(.:format)                                          chat_rooms#index
#     POST   /department/:department_id/chat_rooms(.:format)                                          chat_rooms#create
# new_department_chat_room GET    /department/:department_id/chat_rooms/new(.:format)                                      chat_rooms#new
# edit_department_chat_room GET    /department/:department_id/chat_rooms/:id/edit(.:format)                                 chat_rooms#edit
# department_chat_room GET    /department/:department_id/chat_rooms/:id(.:format)                                      chat_rooms#show
#     PATCH  /department/:department_id/chat_rooms/:id(.:format)                                      chat_rooms#update
#     PUT    /department/:department_id/chat_rooms/:id(.:format)                                      chat_rooms#update
#     DELETE /department/:department_id/chat_rooms/:id(.:format) 

    def new 
        @chat_room = ChatRoom.new
        @department = found_department 
    end

    def create
        @department = found_department 
        @chat_room = ChatRoom.new(chat_params)
        @chat_room.department = @department 
        if @chat_room.save 
            @department.chat_room = @chat_room 
            redirect_to department_chat_room_path(@department,@chat_room)
        else 
            render "chat_rooms/new"
        end
    end

    def edit 
        @chat_room = found_chat_room 
        @department = found_department
    end 

    def update 
        @chat_room = found_chat_room 
        @department = found_department

        if @chat_room.update(chat_params)
            redirect_to department_chat_room_path(@department,@chat_room)
        else 
            render "chat_rooms/edit"
        end
    end

    def destroy
        @chat_room = found_chat_room 
        @chat_room.delete 
        redirect_to found_department
    end

    def show 
        @files = []
        @message = Message.new
        @chat_room =found_chat_room
    
        @messages = Message.where("chat_room_id = :chat_room",chat_room: @chat_room.id)

        @messages.each do |message|
            @files << message if message.attachment_data
        end
       
        
        @department = found_department
    end

    private 
    def found_department 
        Department.find_by(id: params[:department_id])
    end

    def found_chat_room 
        ChatRoom.find_by(id: params[:id])
    end
    def chat_params
        params.require(:chat_room).permit(:title)
    end


end
