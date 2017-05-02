class AddUserBeliefToSitterforms < ActiveRecord::Migration
  def change
    add_column :sitterforms, :user_belief, :integer
  end
end
