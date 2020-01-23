class AddWelcomedFlag < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :welcomed, :integer, :null => false, :default => 0
  end
end
