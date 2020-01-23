class CreateAttachedFiles < ActiveRecord::Migration[4.2]
  def self.up
    create_table :attached_files do |t|
      t.references :attachable, :polymorphic => true
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.string :attachment_file_size
      t.string :attachment_updated_at
      t.string :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :attached_files
  end
end
