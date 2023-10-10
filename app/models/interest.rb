class Interest < ApplicationRecord
  # Relationships
  belongs_to :user

  # Validations
  validates :name, presence: true, length: { minimum: 2 }
end