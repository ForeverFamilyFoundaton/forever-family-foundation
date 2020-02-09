RSpec.feature 'As an admin user' do
  let!(:user) { create(:user) }

  before do
    sign_in_as_admin
  end

  scenario 'I can soft delete a user', :js do
    visit admin_users_path
    within "#user_#{user.id}" do
      click_on 'View'
    end
    accept_confirm do
      click_on 'Soft-Delete'
    end
    expect(page).not_to have_content user.email
    click_on 'Soft Deleted'
    within "#user_#{user.id}" do
      click_on 'View'
    end
    accept_confirm do
      click_on 'Un-Soft-Delete'
    end
    expect(page).to have_content user.email
  end
end
