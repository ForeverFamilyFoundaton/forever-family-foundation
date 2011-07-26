require 'test_helper'

class AdgAnswerTest < ActiveSupport::TestCase
  should belong_to :user
  should belong_to :adg_question
  should validate_presence_of :user_id
  should validate_presence_of :adg_question_id
  should_not allow_mass_assignment_of :user_id
end
