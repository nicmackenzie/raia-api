class User < ApplicationRecord
    # Relationships
    belongs_to :county, optional: true
    has_many :interests
    # add other relationships here as needed...
  
    has_secure_password
 
    # Enums
    enum role: { citizen: 0, leader: 1, admin: 2 }
  
    # Validations
    validates :email, presence: true, uniqueness: true
    validates :full_name, presence: true
    # add other validations here as needed...
  end
  