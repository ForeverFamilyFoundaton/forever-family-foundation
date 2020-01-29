class CreateSitterforms < ActiveRecord::Migration[4.2]
  def change
    create_table :sitterforms do |t|
      t.string :phone
      t.string :cell
      t.string :alt_email
      t.text   :website
      t.text   :facebook
      t.text   :pinterest
      t.text   :instagram
      t.text   :twitter
      t.text   :youtube
      t.text   :blog
      t.text   :related_contact_info
      t.boolean :been_to_medium
      t.text   :consider_yourself
      t.boolean :lost_loved_one
      t.string :signature

      t.timestamps null: false
    end
  end
end
