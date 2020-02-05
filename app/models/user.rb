class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true, length: {maximum: 255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX},
  uniqueness: { case_sensitive: false }
  
  has_many :favorites
  has_many :sites, through: :favorites
  has_many :languages, through: :favorites
end
