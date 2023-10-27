class User < ApplicationRecord
  # Enums
  enum role: { citizen: 0, leader: 1, admin: 2 }
  
  # Relationships
  has_many :discussion_replies
  has_many :discussions
  has_many :reviews
  has_many :messages_sent, class_name: 'Message', foreign_key: 'sender_id'
  has_many :messages_received, class_name: 'Message', foreign_key: 'receiver_id'
  belongs_to :county, optional: true
  has_many :interests
  has_many :leader_uploads
  has_many :events
  has_many :event_attendees
  has_many :event_enquiries
    
  # # Following functionality
  has_many :active_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower  
    
  # Scopes
  scope :top_influencers, -> { order(points: :desc).limit(5) }    
    
  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email format" }
  validates :full_name, presence: true, length: { minimum: 3 }
  validates :contact, presence: true,uniqueness: true, format: { with: /\A[+]?[\d\s\-()]*\z/, message: "must be a valid phone number" }
  validates :username, uniqueness: true, on: :create

  # Uncomment if needed in the future
  # validates :national_id, presence: true, uniqueness: true, length: { is: 10 }, numericality: { only_integer: true }, on: :update
  # validates :gender, presence: true, inclusion: { in: %w(male female other), message: "%{value} is not a valid gender" }, on: :update
  
  # Callbacks
  before_create :generate_random_username

  private

  def generate_random_username
    loop do
      self.username = "user_#{SecureRandom.hex(4)}"
      break unless User.exists?(username: username)
    end
  end
end
  