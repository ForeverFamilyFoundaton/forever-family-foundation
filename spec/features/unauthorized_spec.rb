RSpec.feature 'As a guest' do
  scenario 'user#show redirects to sign in page' do
    visit '/users/foo'
    expect(page).to have_content I18n.t('devise.failure.unauthenticated')
  end
end
