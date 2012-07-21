class UpdateDevise < ActiveRecord::Migration
  def change
    # Recoverable
    add_column :users,  :reset_password_sent_at, :datetime
    add_column :admin_users,  :reset_password_sent_at, :datetime
    # Encryptable
    add_column :users,  :password_salt, :string
    add_column :admin_users,  :password_salt, :string

    ## Lockable
    add_column :users,  :failed_attempts, :integer, :default => 0
    add_column :admin_users,  :failed_attempts, :integer, :default => 0
    add_column :users,  :unlock_token, :string
    add_column :admin_users,  :unlock_token, :string
    add_column :users,  :locked_at, :datetime
    add_column :admin_users,  :locked_at, :datetime

    # Token authenticatable
    add_column :users,  :authentication_token, :string
    add_column :admin_users,  :authentication_token, :string

    ## Invitable
    add_column :users,  :invitation_token, :string
    add_column :admin_users,  :invitation_token, :string
  end
end