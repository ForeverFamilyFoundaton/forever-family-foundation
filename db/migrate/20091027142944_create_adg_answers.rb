class CreateAdgAnswers < ActiveRecord::Migration
  def self.up
    create_table :adg_answers do |t|
      t.references :user
      t.references :adg_question
      t.timestamps
    end
  end

  def self.down
    drop_table :adg_answers
  end
end
