class RenameBizColInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :business, :is_business
  end

  def self.down
    rename_column :users, :is_business, :business
  end
end
