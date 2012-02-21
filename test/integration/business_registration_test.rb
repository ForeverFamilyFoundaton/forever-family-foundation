require 'integration_helper'

class UserTest < ActionDispatch::IntegrationTest

  setup do
    @user = FactoryGirl.create(:user, { email: 'abc@example.com'})
  end

  teardown do
    DatabaseCleaner.clean
  end

  test 'Business registration' do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on "Submit"

    assert_match "users/#{@user.id}/businesses/1/register?step=2", current_url

    click_on "Submit"
    assert_match "users/#{@user.id}/businesses/1/register?step=3", current_url
    assert_match 'My Business', @user.reload.business.name

    attach_file "Business Card", "test/fixtures/files_to_upload/test_file_to_upload_1.gif"
    attach_file "Business Logo", "test/fixtures/files_to_upload/test_file_to_upload_2.png"
    check "I don't have a web banner, please use my business card"
    fill_in "Additional Notes",  with: "some text..."
    click_on "Submit"

    assert_match "users/#{@user.id}/businesses/1/register?step=4", current_url
    attach_file "MP3 File",  "test/fixtures/files_to_upload/test_file_to_upload_1.gif"
    attach_file "Text file",  "test/fixtures/files_to_upload/test_file_to_upload_2.png"
    fill_in "business_promotional_media_text", with: "media text goes here..."
    fill_in  "Additional Notes", with: "some text..."
    click_on "Submit"
    assert_match "users/#{@user.id}", current_url
  end

  test 'Biz reg, skip all pages' do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on "Submit"
    click_on "Submit" #payment
    click_on "Submit or Skip"
    click_on "Submit or Skip"
    click_on "Confirm"
    assert page.has_content?("Welcome")
  end
end