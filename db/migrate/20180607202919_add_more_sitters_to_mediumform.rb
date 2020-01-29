class AddMoreSittersToMediumform < ActiveRecord::Migration[4.2]
  def change
    add_column :mediumforms, :SitterA, :string
    add_column :mediumforms, :SitterB, :string
    add_column :mediumforms, :SitterC, :string
    add_column :mediumforms, :SitterD, :string
    add_column :mediumforms, :SitterE, :string
    add_column :mediumforms, :alt_home_phone, :string
    add_column :mediumforms, :alt_work_email, :string
    add_column :mediumforms, :alt_home_email, :string
  end
end
