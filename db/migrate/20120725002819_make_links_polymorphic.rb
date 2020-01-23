class MakeLinksPolymorphic < ActiveRecord::Migration[4.2]
  def change
    add_column :external_links, :linkable_type, :string
    add_column :external_links, :linkable_id, :integer
  end
end
