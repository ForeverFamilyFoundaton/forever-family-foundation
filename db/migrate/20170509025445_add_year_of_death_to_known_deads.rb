class AddYearOfDeathToKnownDeads < ActiveRecord::Migration[4.2]
  def change
    add_column :known_deads, :year_of_death, :string
  end
end
