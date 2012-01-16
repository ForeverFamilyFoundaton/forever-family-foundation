class ChangeBizStepToState < ActiveRecord::Migration
  def change
    remove_column :businesses, :completed_step
    add_column :businesses, :state, :string
  end
end
