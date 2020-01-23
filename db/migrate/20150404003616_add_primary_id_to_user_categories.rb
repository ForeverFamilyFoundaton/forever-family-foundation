class AddPrimaryIdToUserCategories < ActiveRecord::Migration[4.2]
  def change
    def self.up
      add_column :user_categories, :id, :primary_key
    end
  end
end
