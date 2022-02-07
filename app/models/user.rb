class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  # helper validates that the attribute's value is unique right before the object gets saved
  validates :email, presence: true, :uniqueness => {:case_sensitive => true}
  validates :password, presence: true, confirmation: true, length: {within: 6..40}
  validates :password_confirmation, presence: true, length: {within: 6..40}

end