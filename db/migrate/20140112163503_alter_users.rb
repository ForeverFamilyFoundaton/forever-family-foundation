class AlterUsers < ActiveRecord::Migration
  def up
    # remove_index :users, :email
    change_column :users, :email, :string, null: true
    change_column :users, :id, :integer
    add_column :users, :do_not_mail, :boolean
  end

  def down
    # execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end
end
