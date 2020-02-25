RSpec.feature 'As a guest' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  before do
    clear_emails
    visit new_user_registration_path
  end

  scenario 'I can register as a user', :chrome do
    expect(page).to have_content I18n.t 'devise.registrations.new.confirmation_instructions_1'
    expect(page).to have_content I18n.t 'devise.registrations.new.confirmation_instructions_2'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Sign up'
    expect(page).to have_content I18n.t 'devise.registrations.signed_up_but_unconfirmed'
    open_email email
    current_email.click_link 'Confirm my account'
    expect(page).to have_content I18n.t 'devise.confirmations.confirmed'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content 'Foo'
  end
end
