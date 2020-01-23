class AddColsToAdgAnswers < ActiveRecord::Migration[4.2]
  def self.up
    add_column :adg_answers, :answer, :string, :limit => 5000
    add_column :adg_answers, :radio_checked, :boolean, :default => false
    add_column :adg_answers, :question, :string
  end

  def self.down
    remove_column :adg_answers, :answer
    remove_column :adg_answers, :radio_checked
    remove_column :adg_answers, :question
  end
end
