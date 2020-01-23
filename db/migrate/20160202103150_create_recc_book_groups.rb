class CreateReccBookGroups < ActiveRecord::Migration[4.2]
  def change
    create_table :recc_book_groups do |t|
      t.references :recc_book, indexed: true
      t.references :recc_book_category, indexed: true

      t.timestamps null: false
    end
  end
end
