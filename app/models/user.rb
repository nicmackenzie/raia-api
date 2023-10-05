class User < ApplicationRecord
    has_many :discussion_replies
    has_many :discussions
    has_many :reviews
    has_many :messages
end
