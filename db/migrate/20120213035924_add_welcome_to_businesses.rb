class AddWelcomeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :welcomed, :boolean, :default => false
  end
end
