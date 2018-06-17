class CreateMediumformPreferences < ActiveRecord::Migration
  def change
    create_table :mediumform_preferences do |t|
      t.string :name
      t.string :preference_type
      t.timestamps  null: true
    end
  end
end
