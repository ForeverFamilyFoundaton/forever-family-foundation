class ChangeConsiderYourselfInSitterform < ActiveRecord::Migration
  def up
    change_column :sitterforms, :consider_yourself, :integer
  end
  def down
    change_column :sitterforms, :consider_yourself, :integer
  end
end
