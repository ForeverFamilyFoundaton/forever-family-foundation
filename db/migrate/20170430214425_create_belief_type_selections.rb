class CreateBeliefTypeSelections < ActiveRecord::Migration
  def change
    create_table :belief_type_selections do |t|
      t.integer :belief_type_id
      t.integer :sitterform_id

      t.timestamps null: false
    end
  end
end
