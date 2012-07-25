class MakeLinksPolymorphic < ActiveRecord::Migration
  def change
    add_column :external_links, :linkable_type, :string
    add_column :external_links, :linkable_id, :integer
  end
end
