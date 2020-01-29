class AddOtherCertificationToMediumforms < ActiveRecord::Migration[4.2]
  def change
    add_column :mediumforms, :other_certification, :text
  end
end
