class User < ActiveRecord::Base
  has_secure_password
  has_many :devices
  has_many :messages
  has_many :webhooks
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, confirmation: true
end
