class AddAttachmentFileToExports < ActiveRecord::Migration[4.2]
  def self.up
    change_table :exports do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :exports, :file
  end
end
