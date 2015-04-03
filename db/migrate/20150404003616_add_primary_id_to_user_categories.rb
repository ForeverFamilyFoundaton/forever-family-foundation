class AddPrimaryIdToUserCategories < ActiveRecord::Migration
  def change
    def self.up
      add_column :user_categories, :id, :primary_key
    end
  end
end
