class AddMediumContactsToSitterform < ActiveRecord::Migration[4.2]
  def change
    add_column :sitterforms, :medium_contacts, :text
  end
end
