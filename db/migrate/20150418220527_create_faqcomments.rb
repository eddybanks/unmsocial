class CreateFaqcomments < ActiveRecord::Migration
  def change
    create_table :faqcomments do |t|
      t.references :user, index: true
      t.text :comment

      t.timestamps null: false
    end
    add_foreign_key :faqcomments, :users
  end
end
