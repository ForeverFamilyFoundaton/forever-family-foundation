RSpec.feature 'ADMIN: AdminUsers' do
  before { sign_in_as_admin }

  let(:business) { create(:business_complete ) }
  let(:user) { create(:user, business: business) }

  it 'Edits an admin user' do
    create(:admin_user, email: 'test@example.com', password: 'password')
    click_link 'Admin Users'
    click_link 'test@example.com'
    click_on 'Edit Admin User'
    expect(page).to have_content('Edit Admin User')
  end
end
