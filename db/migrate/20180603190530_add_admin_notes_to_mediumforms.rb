class AddAdminNotesToMediumforms < ActiveRecord::Migration[4.2]
  def change
    add_column :mediumforms, :MEPC_Removed, :datetime
    add_column :mediumforms, :MEPC_Failed, :datetime
    add_column :mediumforms, :admin_notes, :text
  end
end
