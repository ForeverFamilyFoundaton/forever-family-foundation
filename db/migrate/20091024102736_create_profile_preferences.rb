class CreateProfilePreferences < ActiveRecord::Migration[4.2]
  def self.up
    create_table :profile_preferences do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :profile_preferences
  end
end
