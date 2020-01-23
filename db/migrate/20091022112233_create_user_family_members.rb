class CreateUserFamilyMembers < ActiveRecord::Migration[4.2]
  def self.up
    create_table :user_family_members do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.timestamps
    end
  end

  def self.down
    drop_table :user_family_members
  end
end
