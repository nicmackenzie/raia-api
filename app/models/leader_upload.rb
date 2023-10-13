class LeaderUpload < ApplicationRecord
    belongs_to :user

    validates :upload_url, presence: true
end
