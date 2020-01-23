class RenameTable < ActiveRecord::Migration[4.2]
  def self.up
    rename_table :after_life_discussion_group_questions, :adg_questions
    rename_table :user_family_members, :family_members
  end

  def self.down
    rename_table :adg_questions, :after_life_discussion_group_questions
    rename_table :family_members, :user_family_members
  end
end
