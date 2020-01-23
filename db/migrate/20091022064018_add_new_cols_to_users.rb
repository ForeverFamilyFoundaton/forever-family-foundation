class AddNewColsToUsers < ActiveRecord::Migration[4.2]
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cell_phone, :string
    add_column :users, :home_phone, :string
    add_column :users, :work_phone, :string
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :middle_name
    remove_column :users, :last_name
    remove_column :users, :cell_phone
    remove_column :users, :home_phone
    remove_column :users, :work_phone
  end
end
