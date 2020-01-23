class CreateCmsImages < ActiveRecord::Migration[4.2]
  def change
    create_table :cms_images do |t|
      t.string :title
      t.text :caption

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
