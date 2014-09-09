require 'feature_helper'

describe 'Business registration' do

  before do
    @user = FactoryGirl.create(:user, { email: 'abc@example.com'})
  end

  it 'Business registration', js: true do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on "Submit"

    page_address.path.should match("payment")
    fill_in_payment_details
    click_on "Submit"
    page_address.query.should match "step=3"
    @user.reload.business.name.should == 'My Business'

    attach_file "Business Card", "spec/fixtures/img/test.gif"
    attach_file "Business Logo", "spec/fixtures/img/test.gif"
    check "I don't have a web banner, please use my business card"
    fill_in "Additional Notes",  with: "some text..."
    click_on "Submit"
    page_address.query.should match "step=4"
    attach_file "MP3 File",  "spec/fixtures/img/test.gif"
    attach_file "Text file", "spec/fixtures/img/test.gif"
    fill_in "business_promotional_media_text", with: "media text goes here..."
    fill_in  "Additional Notes", with: "some text..."
    click_on "Submit"
    page_address.path.should match "users/#{@user.id}"
  end

  it 'Biz reg, skip all pages' do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on "Submit"
    fill_in_payment_details
    click_on "Submit Payment"
    click_on "Submit or Skip"
    click_on "Submit or Skip"
    page.should have_selector('h1', {text: 'Users: Show', visible: true})
  end

  context 'payment screen' do
    it 'processec payment' do
      sign_in(@user)
      visit new_user_business_path(@user)
      fill_in_biz_reg
      click_on "Submit"
    end
  end
end
