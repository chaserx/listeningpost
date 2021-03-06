class Device < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :webhooks

  validates :name, presence: true
  validates :user, presence: true

  scope :for_user, ->(user) { where(user_id: user.id) }
end
