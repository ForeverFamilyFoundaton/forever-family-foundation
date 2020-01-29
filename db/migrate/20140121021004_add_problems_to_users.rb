class AddProblemsToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :problems, :text
  end
end
