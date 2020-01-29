class CreateCmsPages < ActiveRecord::Migration[4.2]
  def change
    create_table :cms_pages do |t|
      t.string :reference_string
      t.string :title
      t.string :sub_title
      t.string :nav_text
      t.text :body

      t.text :meta_keywords
      t.text :meta_description

      t.integer :position
      t.integer :parent_id
      t.timestamps
    end
  end

end
