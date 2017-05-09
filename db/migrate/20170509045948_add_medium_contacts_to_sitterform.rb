class AddMediumContactsToSitterform < ActiveRecord::Migration
  def change
    add_column :sitterforms, :medium_contacts, :text
  end
end
