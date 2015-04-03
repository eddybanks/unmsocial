class CreateEvents < ActiveRecord::Migration

  def change
    create_table :events do |t|
      t.string "name", :limit => 20
      t.string "venue", :limit => 50
      t.datetime "time"
      t.string "type", :limit => 20
      t.integer "capacity"
      t.string "phone_number", :limit => 20
      t.string "pic"
      t.text "details", :limit => 150
      t.timestamps null: false
    end
    add_index("events", "name")
    add_index("events", "time")
  end

end
