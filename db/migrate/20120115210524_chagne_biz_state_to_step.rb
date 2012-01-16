class ChagneBizStateToStep < ActiveRecord::Migration
  def change
    remove_column :businesses, :state
    add_column :businesses, :completed_step, :integer, :null => false, :default => 0
  end
end
