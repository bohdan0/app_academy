# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  # validates :user_name, :session_token, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_token_session
  attr_reader :password

  has_many :cat_rental_requests

  has_many :multi_sessions

  has_many :cats,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :user_id

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # def reset_token!
  #   self.session_token = self.class.generate_token_session
  #   self.save!
  #   self.session_token
  # end
  #
  def reset_token!
    # p id
    a = MultiSession.create(user_id: id, session_token: self.class.generate_token_session)
    a.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def self.generate_token_session
    SecureRandom.urlsafe_base64(128)
  end
  #
  # def ensure_token_session
  #   self.session_token ||= self.class.generate_token_session
  # end

  def ensure_token_session
    user = MultiSession.find_by(user_id: id)
    reset_token! unless user
  end
end
