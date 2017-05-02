class RenameUserBeliefSitterforms < ActiveRecord::Migration
  def change
    rename_column :sitterforms,  :user_belief,  :belief_type_id   
  end
end
