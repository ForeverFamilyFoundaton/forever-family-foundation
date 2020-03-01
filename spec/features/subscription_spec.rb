RSpec.feature 'As a registered user' do
  let(:user) { users(:homer) }

  before do
    login_as user, scope: :user
  end

  scenario 'I can upgrade to a paid subscription' do
    within '.subscription' do
      click_on I18n.t 'users.show.upgrade'
    end
  end
end
