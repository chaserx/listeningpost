class Callback < ActiveRecord::Base
  belongs_to :device
  validates :device, presence: true
  validates :url, presence: true
end
