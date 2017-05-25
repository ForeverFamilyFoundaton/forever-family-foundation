class AddSignatureCheckboxToSitterform < ActiveRecord::Migration
  def change
    add_column :sitterforms, :signature_checkbox, :boolean, default: false
  end
end
