class NewsAndUpdate < ApplicationRecord
  belongs_to :county
  belongs_to :user
end
