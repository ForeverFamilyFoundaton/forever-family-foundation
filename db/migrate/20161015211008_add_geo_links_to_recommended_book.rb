class AddGeoLinksToRecommendedBook < ActiveRecord::Migration[4.2]
  def change
    add_column :recommended_books, :uk_amazon_link, :string
    add_column :recommended_books, :cad_amazon_link, :string
  end
end
