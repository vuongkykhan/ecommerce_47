class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :orders
  has_many :reviews
  validates :name, presence: true, length: {maximum: Settings.name.length}
  validates :email, presence: true, length: { maximum: Settings.email.length },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: Settings.password.length}, allow_nil: true
  validates :address, :city, :phone, :country, presence: true
  before_save {email.downcase!}
  has_secure_password
end
