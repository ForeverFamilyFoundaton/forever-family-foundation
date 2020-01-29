class RenameProfilePreferences < ActiveRecord::Migration[4.2]
  def self.up
    rename_table :profile_preferences, :preferences
    rename_column :users_profile_preferences, :profile_preference_id, :preference_id
    rename_table :users_profile_preferences, :user_preference_selections
  end

  def self.down
    rename_table :preferences, :profile_preferences
    rename_table :users_preference_selections, :user_profile_preferences
    rename_column :users_profile_preferences, :preference_id, :profile_preference_id
  end
end
