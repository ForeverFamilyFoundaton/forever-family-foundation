RSpec.feature 'Business registration' do
  before do
    @user = FactoryBot.create(:user, { email: 'abc@example.com'})
  end

  scenario 'Business registration', :js do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on "Submit"

    expect(page_address.path).to match("payment")
    fill_in_payment_details
    click_on "Submit"
    expect(page_address.query).to match "step=3"
    expect(@user.reload.business.name).to eq 'My Business'

    attach_file "Business Card", "#{Rails.root}/spec/fixtures/img/test.gif"
    attach_file "Business Logo", "#{Rails.root}/spec/fixtures/img/test.gif"
    check "I don't have a web banner, please use my business card"
    fill_in "Additional Notes",  with: "some text..."
    click_on "Submit"

    expect(current_url).to match "step=4"
    attach_file "MP3 File",  "#{Rails.root}/spec/fixtures/img/test.gif"
    attach_file "Text file", "#{Rails.root}/spec/fixtures/img/test.gif"

    fill_in "business_promotional_media_text", with: "media text goes here..."
    fill_in  "Additional Notes", with: "some text..."
    click_on "Submit"
    expect(page_address.path).to match "users/#{@user.id}"
  end

  scenario 'Biz reg, skip all pages' do
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on "Submit"
    fill_in_payment_details
    click_on "Submit Payment"
    click_on "Submit or Skip"
    click_on "Submit or Skip"
    expect(page).to have_selector('h1', {text: 'Users: Show', visible: true})
  end

  context 'payment screen' do
    scenario 'processec payment' do
      sign_in(@user)
      visit new_user_business_path(@user)
      fill_in_biz_reg
      click_on "Submit"
    end
  end
end
