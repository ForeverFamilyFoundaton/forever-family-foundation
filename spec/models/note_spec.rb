require 'rails_helper'

describe Note do
  it { should belong_to :user }
  it { should validate_presence_of :content }
end
