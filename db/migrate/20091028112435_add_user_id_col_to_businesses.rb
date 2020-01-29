class AddUserIdColToBusinesses < ActiveRecord::Migration[4.2]
  def self.up
    add_column :businesses, :user_id, :integer
  end

  def self.down
    remove_column :businesses, :user_id
  end
end
