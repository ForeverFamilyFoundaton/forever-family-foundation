class CreateReccBookCategories < ActiveRecord::Migration
  def change
    create_table :recc_book_categories do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
