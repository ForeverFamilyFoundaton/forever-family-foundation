class CreateReccBooks < ActiveRecord::Migration[4.2]
  def change
    create_table :recc_books do |t|
      t.string :title
      t.string :author
      t.string :amazon_link

      t.timestamps null: false
    end
  end
end
