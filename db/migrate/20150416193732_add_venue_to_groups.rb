class AddVenueToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :venue, :string
  end
end
