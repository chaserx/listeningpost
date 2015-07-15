class Device < ActiveRecord::Base
  has_many :messages
  has_one :callback
  validates :name, presence: true
end
