class AlterAnnouncements < ActiveRecord::Migration
  def up
    add_column :announcements, :start_date, :date
    add_column :announcements, :end_date, :date
    add_column :announcements, :link, :text
    add_column :announcements, :button, :text
  end
end
