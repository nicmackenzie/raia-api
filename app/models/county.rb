class County < ApplicationRecord
    # Relationships
    has_many :users
  
    # Validations
    validates :name, presence: true, length: { minimum: 3 }
  end
  