class NewsAndUpdates < ApplicationRecord
  belongs_to :county
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
