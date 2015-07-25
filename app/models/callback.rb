# a POST to URL after _each_ recorded message
class Callback < ActiveRecord::Base
  belongs_to :device
  validates :device, presence: true
  validates :url, presence: true # maybe also validate url structure

  # should require a default body or just pass-thru from message?
  # validates :body, presence: true

  # note(chaserx): record a log of callbacks?
end
