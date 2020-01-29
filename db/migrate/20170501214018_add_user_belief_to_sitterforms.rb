class AddUserBeliefToSitterforms < ActiveRecord::Migration[4.2]
  def change
    add_column :sitterforms, :user_belief, :integer
  end
end
