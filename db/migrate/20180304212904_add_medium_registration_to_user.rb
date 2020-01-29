class AddMediumRegistrationToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :medium_registration, :boolean, :default => false
  end
end
