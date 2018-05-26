class CreateMediumformPreferenceSelections < ActiveRecord::Migration
  def change
    create_table :mediumform_preference_selections do |t|
      t.references :mediumform
      t.references :mediumform_preference
      t.timestamps null: true
    end
  end
end
