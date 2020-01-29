class AddDefaultValueToBusinesses < ActiveRecord::Migration[4.2]
  def change
    remove_column :businesses, :completed_step
    add_column :businesses, :completed_step, :integer, :null => false, :default => 0
  end
end
