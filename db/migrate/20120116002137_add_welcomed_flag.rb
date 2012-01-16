class AddWelcomedFlag < ActiveRecord::Migration
  def change
    add_column :users, :welcomed, :integer, :null => false, :default => 0
  end
end
