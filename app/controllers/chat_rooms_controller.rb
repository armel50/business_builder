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
    end

    def create 
        @chat_room = ChatRoom.new()
    end

    def edit 
    end 

    def destroy
    end

    private 
    def found_department 
        Department.find_by(id: params[:department_id])
    end

    def found_chat_room 
        ChatRoom.find_by(id: params[:id])
    end
    def chat_params
        params.require(:chat_room).permit 
    end


end
