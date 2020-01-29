class CreateAfterLifeDiscussionGroupQuestions < ActiveRecord::Migration[4.2]
  def self.up
    create_table :after_life_discussion_group_questions do |t|
      t.string  :question
      t.boolean :show_answer_by_textarea, :default => false
      t.boolean :show_answer_by_radio, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :after_life_discussion_group_questions
  end
end
