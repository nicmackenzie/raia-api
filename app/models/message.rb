class Message < ApplicationRecord
    belongs_to :sender,class_name: 'User',foreign_key: 'sender_id'
    belongs_to :receiver,class_name: 'User',foreign_key: 'receiver_id'
    validates :receiver_id,:sender_id,:content,presence: true 
    validate :sender_and_receiver_not_the_same

    def sender_and_receiver_not_the_same
        if sender_id == receiver_id
            errors.add(:base,"Sender and receiver cannot be the same")
        end
    end
    
end
