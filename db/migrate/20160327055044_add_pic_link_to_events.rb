class AddPicLinkToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pic_link, :string
  end
end
