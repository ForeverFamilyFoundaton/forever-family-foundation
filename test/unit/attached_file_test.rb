require 'test_helper'

class AttachedFileTest < ActiveSupport::TestCase
  should belong_to :attachable
  should allow_mass_assignment_of :attachment
  should allow_mass_assignment_of :kind
end
