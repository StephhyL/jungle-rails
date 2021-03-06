class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password,
            presence: true,
            confirmation: true,
            length: {
              minimum: 5,
            }
  validates :password_confirmation, presence: true

  # def authenticate_with_credentials(email, password)
  #   @user = User.new(email, password)
  #   @user.valid? @user.

  # end

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.downcase.strip)
    @user && @user.authenticate(password) ? @user : nil
  end
end
