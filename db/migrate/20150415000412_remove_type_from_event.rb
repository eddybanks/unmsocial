class RemoveTypeFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :type, :string
  end
end
