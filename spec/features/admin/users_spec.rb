require_relative '../feature_helper'

describe 'ADMIN: Users' do
  before { sign_in_as_admin }

  it 'Creates a user' do
    click_link 'Users'
    click_on 'New User'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'alphabravo', match: :prefer_exact
    fill_in 'Password confirmation', with: 'alphabravo', match: :prefer_exact
    fill_in 'Address', with: '123 Fake st.'
    fill_in 'City', with: 'New York'
    fill_in 'State', with: 'NY'
    fill_in 'Zip', with: '10014'
    click_on 'Create User'
    expect(page).to have_content('User was successfully created.')
  end

  it 'edits a user without needing the password' do
    create(:user, email: 'test@example.com')
    click_link 'Users'
    click_link 'test@example.com'
    click_on 'Edit User'
    click_on 'Update User'
    expect(page).to have_content('User was successfully updated.')
  end
end
