class Message < ActiveRecord::Base
  belongs_to :device
  validates :device, presence: true
end
