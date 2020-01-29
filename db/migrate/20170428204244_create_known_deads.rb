class CreateKnownDeads < ActiveRecord::Migration[4.2]
  def change
    create_table :known_deads do |t|
      t.integer  :user_id
      t.integer  :relationship_id
      t.integer  :sitterform_id
      t.string   :name

      t.timestamps null: false
    end
  end
end
