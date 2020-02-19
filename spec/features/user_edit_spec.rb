RSpec.feature 'User edit' do
  before do
    @user = FactoryBot.create(:user, { email: 'abc@example.com'})
  end

  context 'when not logged in' do
    scenario 'user#show redirects to sign in page' do
      visit '/users/foo'
      expect(page).to have_content I18n.t('devise.failure.unauthenticated')
    end
  end

  it 'Edit sections' do
    allow(Stripe::Charge).to receive(:create) { true }
    sign_in @user
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on 'Submit'
    fill_in_payment_details
    click_on 'Submit'
    click_on 'Submit or Skip'
    click_on 'Submit or Skip'
    click_on 'My Profile'
    click_on 'Edit Business Details'
  end
end
