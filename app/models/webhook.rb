class Webhook < ActiveRecord::Base
  belongs_to :device
  belongs_to :user

  validates :device, presence: true
  validates :url, presence: true # also validate url structure
  validates :message_body, presence: true
  validates :user, presence: true
end
