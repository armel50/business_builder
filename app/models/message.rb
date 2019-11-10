class Message < ApplicationRecord
    validates :content, presence: true, unless: :attachment_data
    belongs_to :chat_room 
    belongs_to :user
    # has_one_attached :file
    include AttachmentUploader[:attachment]
    after_create_commit{
        MessageBroadcastJob.perform_later(self)
    }
    def attachment_name=(name)
        @attachment_name = name
    end
    
    def attachment_name
        @attachment_name
    end

    def attachment_data_uri=(name)
        @attachment_data_uri = name
    end
    
    def attachment_data_uri
        @attachment_data_uri
    end
end
