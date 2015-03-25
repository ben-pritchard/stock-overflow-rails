class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable
  has_many :questions
  attr_accessor :password

  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates_confirmation_of :password
  before_save :encrypt_password
  after_create :send_welcome_message

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def send_welcome_message
    CustomerMailer.send_welcome_message(self).deliver_now
  end

  def is_email?
    self.email.include?('@') && self.email.include?('.')
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
