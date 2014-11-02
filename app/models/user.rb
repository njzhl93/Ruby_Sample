class User < ActiveRecord::Base
  before_save do |user| 
              user.email = email.downcase 
              user.remember_token = SecureRandom.urlsafe_base64
              end
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
#   def User.new_remember_token
#     SecureRandom.urlsafe_base64
#   end
#   def User.encrypt(token)
#   	  Digest::SHA1.hexdigest(token.to_s)
#   end

#   private
#     def create_remember_token
#       self.remember_token = User.encrypt(User.new_remember_token)
#     end
# end