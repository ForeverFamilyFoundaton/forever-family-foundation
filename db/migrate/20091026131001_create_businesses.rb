class CreateBusinesses < ActiveRecord::Migration[4.2]
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :fax
      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
