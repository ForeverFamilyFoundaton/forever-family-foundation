class ChangeReccNames < ActiveRecord::Migration[4.2]
  def change
    rename_table :recc_books, :recommended_books

    rename_table :recc_book_categories, :recommended_book_categories

    rename_table :recc_book_groups, :recommended_book_groups

    rename_column :recommended_book_groups, :recc_book_id, :recommended_book_id
    rename_column :recommended_book_groups, :recc_book_category_id, :recommended_book_category_id
  end
end
