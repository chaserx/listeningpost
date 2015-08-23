class RemoveCallbacks < ActiveRecord::Migration
  def up
    drop_table :callbacks
  end

  def down
    create_table "callbacks", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
      t.string   "body"
      t.string   "url"
      t.uuid     "device_id"
      t.uuid     "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
