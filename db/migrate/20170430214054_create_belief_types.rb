class CreateBeliefTypes < ActiveRecord::Migration
  def change
    create_table :belief_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
