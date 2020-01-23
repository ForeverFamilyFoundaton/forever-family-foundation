class ChangeRadioColInAdgAnswers < ActiveRecord::Migration[4.2]
  def self.up
    change_column :adg_answers, :radio_checked, :string
    rename_column :adg_answers, :radio_checked, :radio_val
  end

  def self.down
    rename_column :adg_answers, :radio_val, :radio_checked
    change_column :adg_answers, :radio_checked, :boolean
  end
end
