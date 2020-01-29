class AddWelcomeToBusinesses < ActiveRecord::Migration[4.2]
  def change
    add_column :businesses, :welcomed, :boolean, :default => false
  end
end
