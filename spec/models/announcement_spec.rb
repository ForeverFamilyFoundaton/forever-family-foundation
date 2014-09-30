require 'spec_helper'

describe Announcement do
  it { should validate_uniqueness_of :start_date }
  it { should validate_uniqueness_of :end_date }
  it { should validate_presence_of :button }
  it { should validate_presence_of :link }

end