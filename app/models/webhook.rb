class Webhook < ActiveRecord::Base
  belongs_to :device
  validates :device, presence: true
  validates :url, presence: true # maybe also validate url structure
end
