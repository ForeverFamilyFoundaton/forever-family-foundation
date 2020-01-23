class AddUserIdToSitterForm < ActiveRecord::Migration[4.2]
  def change
    add_column :sitterforms, :user_id, :integer
  end
end
