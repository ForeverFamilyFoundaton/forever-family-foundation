class CreateRadioArchives < ActiveRecord::Migration[4.2]
  def change
    create_table :radio_archives do |t|
      t.string :format
      t.date :date
      t.string :title
      t.string :guest

      t.timestamps
    end
  end
end
