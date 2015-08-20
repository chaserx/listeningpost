class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: :uuid do |t|
      t.string :name
      t.uuid :user_id, index: true
      t.timestamps null: false
    end
  end
end
