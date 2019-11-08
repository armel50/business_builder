require "pry"
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # binding.pry
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end
    private
    def find_verified_user
      if  cookies.encrypted[:user_id]
         User.find_by(id: cookies.encrypted[:user_id])
      else
        reject_unauthorized_connection
      end
    end
  end
end
