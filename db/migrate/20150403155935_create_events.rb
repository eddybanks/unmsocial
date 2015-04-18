class CreateEvents < ActiveRecord::Migration

  def change
    create_table :events do |t|
      t.string "name"
      t.string "venue"
      t.datetime "time"
      t.string "type"
      t.integer "capacity"
      t.string "phone_number", :limit => 20
      #t.string "pic"
      t.text "details"
      t.timestamps null: false
    end
    add_index("events", "name")
    add_index("events", "time")
  end

end
