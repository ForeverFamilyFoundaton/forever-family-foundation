class AddRelationshipsToSitterform < ActiveRecord::Migration[4.2]
  def change
    add_column :sitterforms, :relationships, :string
  end
end
