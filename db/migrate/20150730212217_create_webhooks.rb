class CreateWebhooks < ActiveRecord::Migration
  def change
    create_table :webhooks do |t|
      t.string :message_body, null: false
      t.uuid :device_id, null: false
      t.string :url, null: false
      t.string :headers
      t.string :access_token
      t.string :request_type, default: 'POST'
      t.json :payload
      t.string :query
      t.string :auth
      t.timestamps null: false
    end
  end
end
