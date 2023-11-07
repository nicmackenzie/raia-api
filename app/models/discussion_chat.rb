class DiscussionChat < ApplicationRecord
    belongs_to :discussion
    belongs_to :user

    # after_create_commit :broadcast_message 

    private

    def broadcast_message
        ActionCable.server.broadcast('DiscussionChatsChannel',{
            id: self.id,
            # message: self.message
        })
    end
end
