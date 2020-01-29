class RemoveColsInAdgQuestions < ActiveRecord::Migration[4.2]
  def self.up
    remove_column :adg_questions, :show_answer_by_textarea
    rename_column :adg_questions, :show_answer_by_radio, :show_radio
  end

  def self.down
    add_column :adg_questions, :show_answer_by_textarea, :boolean
    rename_column :adg_questions, :show_radio, :show_answer_by_radio
  end
end
