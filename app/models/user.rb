class User < ActiveRecord::Base
  has_secure_password

  has_many :devices
  has_many :messages
  has_many :webhooks

  #TODO(chase): also validate email structure
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, confirmation: true
end
