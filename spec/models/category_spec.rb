require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:users).through(:user_categories) }  
  
end
