RSpec.feature 'As a guest' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  before do
    clear_emails
    visit new_user_registration_path
  end

  scenario 'I can register as a user' do
    expect(page).to have_content I18n.t 'devise.registrations.new.confirmation_instructions_1'
    expect(page).to have_content I18n.t 'devise.registrations.new.confirmation_instructions_2'

    # Errors
    click_on 'Sign up'
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content 'Refund policy must be accepted'
    expect(page).to have_content 'Email policy must be accepted'
    expect(page).to have_content 'Volunteer policy must be accepted'
    expect(page).to have_content 'Terms of use must be accepted'

    # Valid
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    check 'user_email_policy'
    check 'user_refund_policy'
    check 'user_volunteer_policy'
    check 'user_terms_of_use'
    click_on 'Sign up'

    # Confirmation
    expect(page).to have_content I18n.t 'devise.registrations.signed_up_but_unconfirmed'
    open_email email
    current_email.click_link 'Confirm my account'
    expect(page).to have_content I18n.t 'devise.confirmations.confirmed'

    # Login
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    expect(page).to have_content I18n.t 'users.show.title'
    expect(page).to have_content email
  end
end
