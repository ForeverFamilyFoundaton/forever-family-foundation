class AddCompletedStepToBusiness < ActiveRecord::Migration
  def self.up
    add_column :businesses, :completed_step, :string
  end

  def self.down
    remove_column :businesses, :completed_step
  end
end
