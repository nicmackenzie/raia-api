class Notification < ApplicationRecord
  belongs_to :user_from, class_name: 'User', optional: true
  belongs_to :user_to, class_name: 'User'
end
