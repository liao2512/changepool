class Partner < ApplicationRecord
  has_many :campaigns, dependent: :destroy
  attr_accessor :remember_token
  before_save { self.username = username.downcase }
  validates :name,  presence: true
  validates :username,  presence: true, 
                        length: { minimum:4, maximum: 50 },
                        uniqueness: { case_sensitive: false }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }
                    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  # Remembers a partner in the database for use in persistent sessions.
  def remember_partner
    self.remember_token = Partner.new_token
    update_attribute(:remember_digest, Partner.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Forgets a partner.
  def forget_partner
    update_attribute(:remember_digest, nil)
  end
end