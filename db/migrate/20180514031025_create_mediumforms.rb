class CreateMediumforms < ActiveRecord::Migration[4.2]
  def change
    create_table :mediumforms do |t|
      t.integer :user_id
      t.string  :personalprofessional
      t.string  :alt_first_name
      t.string  :alt_middle_name
      t.string  :alt_last_name
      t.string  :alt_work_phone
      t.string  :alt_mobile_phone
      t.string  :alt_address_line1
      t.string  :alt_address_line2
      t.string  :alt_city
      t.string  :alt_state
      t.string  :alt_zipcode
      t.string  :alt_country
      t.string  :alt_email
      t.boolean :health_healing
      t.text    :other_businesses
      t.string  :website
      t.string  :blog
      t.string  :facebook
      t.string  :pinterest
      t.string  :instagram
      t.string  :twitter
      t.string  :youtube
      t.string  :other
      t.text    :other_primary_owner
      t.text    :other_related
      t.text    :other_not_related
      t.text    :became_aware
      t.text    :immediate_family
      t.text    :life_event
      t.text    :specific_goal
      t.text    :medium_priority
      t.text    :different_info
      t.text    :hear_about_fff
      t.text    :medium_history
      t.text    :kind_of_readings
      t.text    :self_classify
      t.text    :medium_preferences
      t.text    :other_classify
      t.text    :mediumship_training
      t.text    :ethics1
      t.text    :ethics2
      t.text    :ethics3
      t.text    :ethics4
      t.string  :sitter1
      t.string  :sitter2
      t.string  :sitter3
      t.string  :sitter4
      t.string  :sitter5
      t.string  :medium_status
      t.string  :test_date
      t.string  :application_date
      t.boolean :signature_checkbox, :default => false
      t.string  :signature
    end
  end
end
