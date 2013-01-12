require_relative 'feature_helper'

describe 'User edit' do
  before do
    @user = FactoryGirl.create(:user, { email: 'abc@example.com'})
  end

  it 'Edit sections' do
    stub_request(:any, 'https://js.stripe.com/v1/').to_return body: File.new(Rails.root + 'spec/support/stripe.js').read
    Stripe::Charge.stub(:create).and_return(true)
    sign_in(@user)
    visit new_user_business_path(@user)
    fill_in_biz_reg
    click_on 'Submit'
    fill_in_payment_details
    click_on 'Submit'
    click_on 'Submit or Skip'
    click_on 'Submit or Skip'
    # click_on 'Confirm'
    click_on 'My Profile'
    click_on 'Edit Business Details'
  end
end
