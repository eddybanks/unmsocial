class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string "username", :limit => 30
      t.string "fname", :limit => 15
      t.string "lname", :limit => 15
      t.date "date_of_birth"
      t.string "gender"
      t.text "address", :limit => 50
      t.string "email", :limit => 20
      t.string "phone_number", :limit => 20
      t.timestamps null: false
    end
    add_index("users", "username")
    add_index("users", "date_of_birth")
  end

end
