require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should belong_to :user
  should validate_presence_of :content
end
