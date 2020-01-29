class AddCountryColumnToAddress < ActiveRecord::Migration[4.2]
  def self.up
    add_column :addresses, :country, :string
  end

  def self.down
  end
end
