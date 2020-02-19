RSpec.feature 'As an admin user' do
  let!(:business) { create(:business_complete ) }
  let!(:user) do
    create(
      :user,
      business: business,
      preferences: [Preference.create(name: "hello world")]
    )
  end

  before do
    sign_in_as_admin
    click_on 'Users'
  end

  scenario 'I can create a user' do
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

  scenario 'I can edit a user without needing the password' do
    click_on 'View'
    click_on 'Edit User'
    click_on 'Update User'
    expect(page).to have_content('User was successfully updated.')
  end

  scenario 'I can sort Users by #business.name'   do
    click_on 'Business Name'
    expect(page).to have_content user.business.name
  end

  context 'with attachments' do
    it "renders the page sucessfully" do
      click_on 'View'
      expect(page).to have_content user.first_name
    end
  end

  it "should show a preference column" do
    expect(page).to have_content "#{user.preferences.map(&:name).to_sentence}"
  end

  it "permission Sitter registration for user" do
    click_on 'View'
    click_on 'Edit User'
    check('Sitter registration')
    click_button 'Update User'
    expect(page).to have_content 'Yes'
  end

  scenario 'CSV downloads contain association data' do
    click_on 'CSV'
    header = page.response_headers['Content-Disposition']
    expect(header).to match /^attachment/
    expect(header).to match /filename="users-#{Date.today}.csv"$/
    expect(page).to have_content 'Address: street'
    expect(page).to have_content 'Address: city'
    expect(page).to have_content 'Address: state'
    expect(page).to have_content 'Address: zip'
    expect(page).to have_content 'Address: country'
    expect(page).to have_content 'Preferences'
  end
end
