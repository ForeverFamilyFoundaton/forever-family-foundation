class CreateMediumforms < ActiveRecord::Migration
  def change
    create_table :mediumforms do |t|
      t.integer :user_id
      t.boolean :use_professional
      t.string  :professional_name
      t.boolean :different_address
      t.string  :professional_address_line1
      t.string  :professional_address_line2
      t.string  :professional_phone_number
      t.string  :professional_email
      t.boolean :use_personal
      t.string  :personal_name
      t.string  :personal_address_line1
      t.string  :personal_address_line2
      t.string  :personal_phone_number
      t.string  :personal_email
      t.boolean :health_healing
      t.text    :other_businesses
      t.text    :website
      t.text    :blog
      t.text    :facebook
      t.text    :pinterest
      t.text    :instagram
      t.text    :twitter
      t.text    :youtube
      t.text    :other
      t.string  :sitter1
      t.string  :sitter2
      t.string  :sitter3
      t.string  :sitter4
      t.string  :sitter5
      t.string  :medium_status
      t.date    :test_date
      t.date    :application_date
      t.boolean :signature_checkbox
      t.string  :signature
    end
  end
end
