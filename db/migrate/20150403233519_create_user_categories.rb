class CreateUserCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :user_categories, id: false do |t|
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
