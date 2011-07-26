class CreateCmsPages < ActiveRecord::Migration
  def self.up
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
    add_index :cms_pages, :reference_string, :unique => true
    add_index :cms_pages, :position
    add_index :cms_pages, :parent_id
  end

  def self.down
    drop_table :cms_pages
  end
end
