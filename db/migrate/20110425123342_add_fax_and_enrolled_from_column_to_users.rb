class AddFaxAndEnrolledFromColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fax, :string
    add_column :users, :enrolled_from, :string
  end

  def self.down
  end
end
