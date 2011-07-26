class AddUserIdColToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses, :user_id, :integer
  end

  def self.down
    remove_column :businesses, :user_id
  end
end
