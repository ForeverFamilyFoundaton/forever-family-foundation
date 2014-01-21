class AddProblemsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :problems, :text
  end
end
