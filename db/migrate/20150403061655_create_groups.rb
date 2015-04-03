class CreateGroups < ActiveRecord::Migration

  def change
    create_table :groups do |t|
      t.string "group_name", :limit => 50
      t.string "category", :limit => 50
      t.string "phone_number", :limit => 20
      t.text "details"
      t.timestamps null: false
    end
    add_index("groups", "group_name")
  end

end
