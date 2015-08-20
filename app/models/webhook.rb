class Webhook < ActiveRecord::Base
  belongs_to :device
  belongs_to :user
  validates :device, presence: true
  validates :url, presence: true # maybe also validate url structure
end
