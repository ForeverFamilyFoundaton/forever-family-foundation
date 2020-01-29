class ChangeBodyFormatInAnnouncement < ActiveRecord::Migration[4.2]
  def change
    change_column :announcements, :body, :string
    change_column :announcements, :button, :string
  end
end
