class CreateWebhooks < ActiveRecord::Migration
  def change
    create_table :webhooks, id: :uuid do |t|
      t.string :message_body, null: false
      t.uuid :device_id, null: false, index: true
      t.string :url, null: false
      t.string :headers
      t.string :access_token
      t.string :request_type, default: 'POST'
      t.json :payload
      t.string :query
      t.string :auth
      t.uuid :user_id, index: true
      t.timestamps null: false
    end
  end
end
