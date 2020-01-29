class CreateBillingAddresses < ActiveRecord::Migration[4.2]
  def self.up
    create_table :billing_addresses do |t|
      t.string :address
      t.string :state
      t.string :country
      t.string :city
      t.string :zip
      t.references :business

      t.timestamps
    end
  end

  def self.down
    drop_table :billing_addresses
  end
end

