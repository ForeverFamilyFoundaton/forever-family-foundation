class CreateNotes < ActiveRecord::Migration[4.2]
  def self.up
    create_table :notes do |t|
      t.references :user
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
