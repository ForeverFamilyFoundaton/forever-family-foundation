RSpec.describe 'As an admin user' do
  let!(:user) { create(:user) }

  before do
    sign_in_as_admin
  end

  scenario 'I can see the Sidekiq UI' do
    visit admin_dashboard_path
    click_on 'Jobs'
    expect(page).to have_content 'Sidekiq'
  end
end
