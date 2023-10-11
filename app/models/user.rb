class User < ApplicationRecord
    has_many :discussion_replies
    has_many :discussions
    has_many :reviews
    has_many :messages_sent,class_name: 'Message', foreign_key: 'sender_id'
    has_many :messages_received,class_name: 'Message', foreign_key: 'receiver_id'
end
