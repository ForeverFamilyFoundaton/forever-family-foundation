require 'factory_girl'
require './test/factories/addresses'
require './test/factories/users'
FactoryGirl.create(:user)
FactoryGirl.create(:admin)