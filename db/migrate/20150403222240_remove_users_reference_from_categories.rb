class RemoveUsersReferenceFromCategories < ActiveRecord::Migration[4.2]
  def change
    remove_column :categories, :user_id
  end
end
