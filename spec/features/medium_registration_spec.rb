RSpec.feature 'As a registered user' do
  let(:user) { FactoryBot.create :user }

  before do
    sign_in user
  end

  scenario 'I can register to be a Medium' do
    visit new_mediumform_path
    expect(page).to have_content "Medium Registration for "
  end
end
