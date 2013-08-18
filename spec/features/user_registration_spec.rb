require_relative 'feature_helper'

describe 'User registration' do

  it "non biz reg'" do
    visit '/users/sign_up'
    fill_in_reg(email: 'qwe@example.com')
    page.should have_selector('h1', {text: 'USERS: SHOW', visible: true})
  end

  it 'biz reg' do
    visit '/users/sign_up'
    fill_in "user_email", :with => 'asd@example.com'
    fill_in "user_email_confirmation", :with => 'asd@example.com'
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
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

  it 'confirmins email case insensative' do
    visit '/users/sign_up'
    fill_in_reg(email: 'CASE@sensative.com', email_confirmation: 'CASE@sensative.com', password: '')
    find_field('user_email').value.should eq 'case@sensative.com'
    find_field('user_email_confirmation').value.should eq 'case@sensative.com'
  end

end
