require_relative 'feature_helper'

describe 'User registration' do

  it "non biz reg'" do
    visit '/users/sign_up'
    fill_in_reg(email: 'qwe@example.com')
    current_url.should match "/users/"+User.last.id.to_s+"/confirm"
  end

  it 'biz reg' do
    visit '/users/sign_up'
    fill_in "Email", :with => 'asd@example.com'
    fill_in "Email confirmation", :with => 'asd@example.com'
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    fill_in "user_first_name", :with => "Fname"
    fill_in "user_last_name", :with => "Lname"
    fill_in "Address", :with => "Street no. 100"
    fill_in "City", :with => "Los Angeles"
    fill_in "State", :with => "CA"
    fill_in "Zip", :with => "90001"
    check "Yes, I accept the Terms of Use"
    check "I am registering a business"
    click_on "Register"
    current_url.should match "/users/#{User.last.id}/businesses/new"
  end

  it 'valdation' do
    visit '/users/sign_up'
    click_on "Register"
    page.should have_content "Terms of use must be accepted"
    page.should have_content "prohibited this record from being saved"
  end

end
