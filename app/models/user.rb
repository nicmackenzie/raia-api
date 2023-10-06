class User < ApplicationRecord
    # Relationships
    belongs_to :county, optional: true
    has_many :interests
    # add other relationships here as needed...
    
    has_secure_password
   
    # Enums
    enum role: { citizen: 0, leader: 1, admin: 2 }
    
    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email format" }
    validates :full_name, presence: true, length: { minimum: 3 }
    
    validates :national_id, presence: true, uniqueness: true, length: { is: 10 }, numericality: { only_integer: true }
    validates :gender, presence: true, inclusion: { in: %w(male female other), message: "%{value} is not a valid gender" }
    validates :contact, presence: true, format: { with: /\A[+]?[\d\s\-()]*\z/, message: "must be a valid phone number" }
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  
    # ... rest of the model code ...
  end
  