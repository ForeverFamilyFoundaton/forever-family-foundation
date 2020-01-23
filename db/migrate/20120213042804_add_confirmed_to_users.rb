class AddConfirmedToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :businesses, :confirmed, :boolean, :default => false
    add_column :users, :confirmed, :boolean, :default => false
  end
end
