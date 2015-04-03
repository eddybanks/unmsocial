class CreateEventsGroups < ActiveRecord::Migration

  def change
    create_table :events_groups, :id => false do |t|
      t.integer "event_id"
      t.integer "group_id"
    end
    add_index :events_groups, ["event_id", "group_id"]
  end

end
