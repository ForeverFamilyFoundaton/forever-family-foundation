class ChangeBizStepToState < ActiveRecord::Migration[4.2]
  def change
    remove_column :businesses, :completed_step
    add_column :businesses, :state, :string
  end
end
