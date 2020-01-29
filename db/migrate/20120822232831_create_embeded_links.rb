class CreateEmbededLinks < ActiveRecord::Migration[4.2]
  def change
    create_table :embeded_links do |t|
      t.text :body
      t.string :title
      t.string :em_linkable_type
      t.integer :em_linkable_id
      t.timestamps
    end
  end
end
