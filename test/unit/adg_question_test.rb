require 'test_helper'

class AdgQuestionTest < ActiveSupport::TestCase
  should validate_presence_of :question
  should allow_mass_assignment_of :question
  should allow_mass_assignment_of :show_radio
end
