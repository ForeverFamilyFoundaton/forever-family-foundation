class AddPicLinkToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :pic_link, :string
  end
end
