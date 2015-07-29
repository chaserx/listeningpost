class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, id: :uuid do |t|
      t.text :body
      t.uuid :device_id
      t.string :ip_address
      t.timestamps null: false
    end
  end
end
