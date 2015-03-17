class AddAttachmentFileToExports < ActiveRecord::Migration
  def self.up
    change_table :exports do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :exports, :file
  end
end
