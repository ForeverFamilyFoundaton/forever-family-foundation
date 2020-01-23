class CreateMediumformPreferenceSelections < ActiveRecord::Migration[4.2]
  def change
    create_table :mediumform_preference_selections do |t|
      t.references :mediumform
      t.references :mediumform_preference
      t.timestamps null: true
    end
  end
end
