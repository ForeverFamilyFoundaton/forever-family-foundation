class AddSitterRegistrationToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :sitter_registration, :boolean, :default => false
  end
end
