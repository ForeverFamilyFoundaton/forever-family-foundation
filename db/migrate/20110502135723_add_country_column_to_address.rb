class AddCountryColumnToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :country, :string
  end

  def self.down
  end
end
