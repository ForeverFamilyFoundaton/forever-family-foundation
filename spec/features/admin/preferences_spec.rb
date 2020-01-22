RSpec.feature 'Admin area: Preferences' do
  before do
    sign_in_as_admin
  end

  let!(:pref_1) { create(:preference, name: 'Receive Emails?') }
  let!(:pref_2) { create(:preference) }

  scenario 'index renders successfully' do
    click_on 'Preferences'
    expect(page).to have_content pref_1.name
    expect(page).to have_content pref_2.name
  end

  scenario 'create works correctly' do
    click_on 'Preferences'
    click_on 'New Preference'
    expect(page).to have_selector '#page_title', text: 'New Preference'
    fill_in 'Name', with: 'Receive emails?'
    click_on 'Create Preference'
    expect(page).to have_content 'Preference was successfully created.'
  end

  scenario 'pref works correctly' do
    click_on 'Preferences'
    within('tr', text: pref_1.name) do
      click_on 'Edit'
    end
    fill_in 'Name', with: 'Get emails?'
    click_on 'Update Preference'
    expect(page).to have_content 'Preference was successfully updated.'
    expect(page).to have_content 'Get emails?'
  end

end
