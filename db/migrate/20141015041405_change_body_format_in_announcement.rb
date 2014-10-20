class ChangeBodyFormatInAnnouncement < ActiveRecord::Migration
  def change
    change_column :announcements, :body, :string
    change_column :announcements, :button, :string
  end
end
