class User < ActiveRecord::Base
  validates :password_digest, :session_token, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(username, pw)
    user = User.find_by_username(username)
    user && user.password?(pw) ? user : nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(128)
  end

  def ensure_session_token
    self.session_token = User.generate_session_token
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
end
