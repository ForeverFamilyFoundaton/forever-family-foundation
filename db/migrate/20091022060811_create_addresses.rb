class CreateAddresses < ActiveRecord::Migration[4.2]
  def self.up
    create_table :addresses do |t|
      t.string :address, :limit => 500
      t.string :city
      t.string :state
      t.string :zip
      t.references :addressable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
