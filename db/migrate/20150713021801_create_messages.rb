class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, id: :uuid do |t|
      t.string :subject
      t.text :body
      t.uuid :device_id, index: true
      t.string :ip_address
      t.uuid :user_id, index: true
      t.timestamps null: false
    end
  end
end
