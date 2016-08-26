class Partner < ApplicationRecord
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
  validates :password, presence: true, length: { minimum: 6 }
  
  # Returns the hash digest of the given string.
  def Partner.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def Partner.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a partner in the database for use in persistent sessions.
  def remember_partner
    self.remember_token = Partner.new_token
    update_attribute(:remember_digest, Partner.digest(remember_token))
  end
end