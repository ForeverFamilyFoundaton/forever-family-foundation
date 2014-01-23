class AddEnrolledAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :enrolled_at, :datetime
  end
end
