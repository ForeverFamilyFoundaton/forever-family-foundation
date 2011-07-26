require 'test_helper'

class CmsPageTest < ActiveSupport::TestCase
  should validate_presence_of :reference_string
  should_not allow_mass_assignment_of :parent_id
  should_not allow_mass_assignment_of :position
end
