class AddColsToUser < ActiveRecord::Migration[4.2]
  def self.up
    add_column :users, :state, :string
    add_column :users, :business, :boolean, :default => false
  end

  def self.down
    remove_column :users, :state
    remove_column :users, :business
  end
end
