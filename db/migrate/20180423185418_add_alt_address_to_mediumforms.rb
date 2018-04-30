class AddAltAddressToMediumforms < ActiveRecord::Migration
  def change
    add_column :mediumforms, :alt_first_name, :string
    add_column :mediumforms, :alt_middle_name, :string
    add_column :mediumforms, :alt_last_name, :string
    add_column :mediumforms, :alt_work_phone, :string
    add_column :mediumforms, :alt_mobile_name, :string
    add_column :mediumforms, :alt_address, :string
    add_column :mediumforms, :alt_city, :string
    add_column :mediumforms, :alt_state, :string
    add_column :mediumforms, :alt_zipcode, :string
    add_column :mediumforms, :alt_country, :string
  end
end
