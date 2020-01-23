class CreateRoles < ActiveRecord::Migration[4.2]
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    create_table :roles_users, :id => false, :force => true do |t|
      t.references  :user
      t.references  :role
    end
  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end
