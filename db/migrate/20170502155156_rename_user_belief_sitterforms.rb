class RenameUserBeliefSitterforms < ActiveRecord::Migration[4.2]
  def change
    rename_column :sitterforms,  :user_belief,  :belief_type_id
  end
end
