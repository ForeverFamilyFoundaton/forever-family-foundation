class AddTypeColToPreferences < ActiveRecord::Migration
  def self.up
    add_column :profile_preferences, :preference_type, :string
  end

  def self.down
    rename_column :profile_preferences, :preference_type
  end
end
