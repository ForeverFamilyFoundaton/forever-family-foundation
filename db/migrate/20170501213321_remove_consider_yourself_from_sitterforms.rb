class RemoveConsiderYourselfFromSitterforms < ActiveRecord::Migration
  def change
    remove_column :sitterforms, :consider_yourself
  end
end
