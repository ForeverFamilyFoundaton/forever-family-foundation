RSpec.feature 'As a user' do
  context 'when not logged in' do
    scenario 'registration redirects to sign in' do
      visit new_mediumform_path
      expect(page).to have_content I18n.t('devise.failure.unauthenticated')
    end
  end

  context 'when logged in' do
    let(:user) { FactoryBot.create :user }

    before do
      sign_in user
    end

    scenario 'I can register to be a Medium' do
      visit new_mediumform_path
      expect(page).to have_content "Medium Registration for "
    end
  end
end
