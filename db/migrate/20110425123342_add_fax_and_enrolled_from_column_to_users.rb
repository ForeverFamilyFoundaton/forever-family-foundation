class AddFaxAndEnrolledFromColumnToUsers < ActiveRecord::Migration[4.2]
  def self.up
    add_column :users, :fax, :string
    add_column :users, :enrolled_from, :string
  end

  def self.down
  end
end
