class AddUserIdToSitterForm < ActiveRecord::Migration
  def change
    add_column :sitterforms, :user_id, :integer
  end
end
