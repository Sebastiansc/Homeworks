class User < ApplicationRecord
  attr_reader :password

  validates :username, :session_token, presence: true
  after_initialize :ensure_session_token
  validates :password, length: { mininum: 6, allow_nil: true}
  validates :password_digest, presence: { message:
  "Password can't be blank"}

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = Bcrypt::Password.create(password)
  end

  def valid_password?(password)
    Bcrypt::Password.new(self.password).is_password?(password)
  end

  def find_by_credentials(username, password)
    user = User.find_by(username: username)
    user.valid_password?(password) ? user : nil
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    @session_token ||= generate_session_token
  end
end
