class AddRelationshipsToSitterform < ActiveRecord::Migration
  def change
    add_column :sitterforms, :relationships, :string
  end
end
