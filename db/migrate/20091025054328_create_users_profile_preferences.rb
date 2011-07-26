class CreateUsersProfilePreferences < ActiveRecord::Migration
  def self.up
    create_table :users_profile_preferences, :id => false do |t|
      t.references :user
      t.references :profile_preference
      t.timestamps
    end
  end

  def self.down
    drop_table :users_profile_preferences
  end
end
