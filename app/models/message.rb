class Message < ActiveRecord::Base
  belongs_to :device
  belongs_to :user

  validates :device, presence: true
  validates :ip_address, presence: true
  validates :user, presence: true

  scope :for_device, ->(device) { where(device_id: device.id) }
end
