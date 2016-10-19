class AddGeoLinksToRecommendedBook < ActiveRecord::Migration
  def change
    add_column :recommended_books, :uk_amazon_link, :string
    add_column :recommended_books, :cad_amazon_link, :string
  end
end
