class CreateCallbacks < ActiveRecord::Migration
  def change
    create_table :callbacks, id: :uuid do |t|
      t.string :body
      t.string :url
      t.uuid :device_id

      t.timestamps null: false
    end
  end
end
