RSpec.feature 'ADMIN: Users' do
  before { sign_in_as_admin }

  let(:business) { create(:business_complete ) }
  let(:user) { create(:user, business: business) }

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

  it 'shows and sorts by #business.name'   do
    user
    click_link 'Users'
    click_link 'Business Name'
    expect(page).to have_content user.business.name
  end

  context 'with attachments' do
    it "renders the page sucessfully" do
      user
      click_link 'Users'
      click_link user.email
      expect(page).to have_content user.first_name
    end
  end

  it "should show a preference column" do
    test = create(:user, email: 'hello@example.com', preferences: [Preference.create(name: "hello world")])

    click_link 'Users'
    expect(page).to have_content "#{test.preferences.map(&:name).to_sentence}"
  end

  it "permission Sitter registration for user" do
    create(:user, email: 'test@example.com')
    click_link 'Users'
    click_link 'test@example.com'
    click_link 'Edit User'
    check('Sitter registration')
    click_button 'Update User'
    expect(page).to have_content 'Yes'
  end
end
