class AddEnrolledAtToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :enrolled_at, :datetime
  end
end
