class RemoveConsiderYourselfFromSitterforms < ActiveRecord::Migration[4.2]
  def change
    remove_column :sitterforms, :consider_yourself
  end
end
