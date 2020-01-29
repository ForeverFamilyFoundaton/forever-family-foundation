class CreateReccBookCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :recc_book_categories do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
