class AddSignatureCheckboxToSitterform < ActiveRecord::Migration[4.2]
  def change
    add_column :sitterforms, :signature_checkbox, :boolean, default: false
  end
end
