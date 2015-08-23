class Device < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :webhooks
  has_one :callback

  validates :name, presence: true
  validates :user, presence: true
end
