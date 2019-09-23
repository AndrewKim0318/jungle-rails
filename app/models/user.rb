class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, presence: true
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase).try(:authenticate, password)
    if user
      return user
    else
      return false
    end
  end
end
