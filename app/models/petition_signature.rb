class PetitionSignature < ApplicationRecord
  belongs_to :petition
  belongs_to :user
end
