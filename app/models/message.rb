class Message < ActiveRecord::Base
  belongs_to :device
  belongs_to :user

  validates :device, presence: true
  validates :ip_address, presence: true
  validates :user, presence: true

  after_create :send_webhook

  private

  def send_webhook
    # Note(chaserx): move this to an async queue one day
    # Update to be webhook not callback
    # if callback=device.callback
    #   result = HTTParty.post(callback.url.to_str,
    #                          body: callback.body.to_json,
    #                          headers: { 'Content-Type' => 'application/json' } )
    #   # log error; inform user if result not :ok
    # end
  end
end
