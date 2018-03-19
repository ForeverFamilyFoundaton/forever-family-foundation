class AddMediumRegistrationToUser < ActiveRecord::Migration
  def change
    add_column :users, :medium_registration, :boolean, :default => false
  end
end