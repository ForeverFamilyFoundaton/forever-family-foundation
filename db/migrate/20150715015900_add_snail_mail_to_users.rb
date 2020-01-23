class AddSnailMailToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :snail_mail, :boolean, null: false, default: false
  end
end
