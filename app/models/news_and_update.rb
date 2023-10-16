class NewsAndUpdate < ApplicationRecord
  belongs_to :county
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :news_and_update_comments
end
