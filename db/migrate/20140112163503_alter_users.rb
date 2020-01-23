class AlterUsers < ActiveRecord::Migration[4.2]
  def up
    remove_column :users, :email
    add_column :users, :email, :string
    add_column :users, :do_not_mail, :boolean
    add_column :users, :membership_number, :integer
  end
end
