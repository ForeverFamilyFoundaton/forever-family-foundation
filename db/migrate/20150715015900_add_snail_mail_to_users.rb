class AddSnailMailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :snail_mail, :boolean, null: false, default: false
  end
end
