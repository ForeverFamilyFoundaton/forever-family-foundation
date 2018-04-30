class AddFieldsToMediumforms < ActiveRecord::Migration
  def change
    add_column :mediumforms, :other_primary_owner, :string
    add_column :mediumforms, :other_related, :string
    add_column :mediumforms, :other_not_related, :string
    add_column :mediumforms, :became_aware, :string
    add_column :mediumforms, :immediate_family, :string
    add_column :mediumforms, :life_event, :string
    add_column :mediumforms, :specific_goal, :string
    add_column :mediumforms, :medium_priority, :string
    add_column :mediumforms, :different_info, :string
    add_column :mediumforms, :hear_about_fff, :string
    add_column :mediumforms, :medium_history, :string
    add_column :mediumforms, :kind_of_readings, :string
    add_column :mediumforms, :self_classify, :string
    add_column :mediumforms, :other_classify, :string
    add_column :mediumforms, :mediumship_training, :string
    add_column :mediumforms, :ethics1, :string
    add_column :mediumforms, :ethics2, :string
    add_column :mediumforms, :ethics3, :string
    add_column :mediumforms, :ethics4, :string
  end
end
