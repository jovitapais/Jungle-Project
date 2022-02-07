class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  # helper validates that the attribute's value is unique right before the object gets saved
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: {within: 6..40}
  validates :password_confirmation, presence: true, length: {within: 6..40}

  def self.authenticate_with_credentials email, password
    user = User.find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end