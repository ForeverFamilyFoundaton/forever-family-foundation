class AddOtherCertificationToMediumforms < ActiveRecord::Migration
  def change
    add_column :mediumforms, :other_certification, :text
  end
end
