class User < ApplicationRecord
    # Relationships
    has_many :discussion_replies
    has_many :discussions
    has_many :reviews
    has_many :messages_sent,class_name: 'Message', foreign_key: 'sender_id'
    has_many :messages_received,class_name: 'Message', foreign_key: 'receiver_id'
    belongs_to :county, optional: true
    has_many :interests
    has_many :leader_uploads
    # add other relationships here as needed...
    
    
   
    # Enums
    
    enum role: { citizen: 0, leader: 1, admin: 2 }
    
    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email format" }
    validates :full_name, presence: true, length: { minimum: 3 }
    
    # validates :national_id, presence: true, uniqueness: true, length: { is: 10 }, numericality: { only_integer: true }, on: :update
    # validates :gender, presence: true, inclusion: { in: %w(male female other), message: "%{value} is not a valid gender" }, on: :update
    validates :contact, presence: true,uniqueness: true, format: { with: /\A[+]?[\d\s\-()]*\z/, message: "must be a valid phone number" }
  
    # ... rest of the model code ...
  end
 
