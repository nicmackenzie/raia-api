class Petition < ApplicationRecord
  belongs_to :user
  has_many :petition_signatures
end
