class Message < ActiveRecord::Base
  belongs_to :device
  validates :device, presence: true

  after_create :send_callback

  private

  def send_callback
    # Note(chaserx): move this to an async queue one day
    if callback=device.callback
      result = HTTParty.post(callback.url.to_str,
                             body: { callback.body }.to_json,
                             headers: { 'Content-Type' => 'application/json' } )
      # log error; inform user if result not :ok
    end
  end
end
