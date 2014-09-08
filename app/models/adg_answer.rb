class AdgAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :adg_question
  validates :user_id, presence: true
  validates :adg_question_id, presence: true

  attr_accessible :answer, :question, :radio_value, :adg_question_id
end
