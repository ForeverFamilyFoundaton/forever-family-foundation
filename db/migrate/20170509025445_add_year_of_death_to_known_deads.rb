class AddYearOfDeathToKnownDeads < ActiveRecord::Migration
  def change
    add_column :known_deads, :year_of_death, :string
  end
end
