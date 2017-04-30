class AddSitterRegistrationToUser < ActiveRecord::Migration
  def change
    add_column :users, :sitter_registration, :boolean, :default => false
  end
end
