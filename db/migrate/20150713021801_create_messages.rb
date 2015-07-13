class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, id: :uuid do |t|
      t.text :body
      t.uuid :device_id
      t.timestamps null: false
    end
  end
end
