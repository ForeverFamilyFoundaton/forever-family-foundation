RSpec.feature 'Admin area: External Links' do

  before do
    sign_in_as_admin
  end

  let!(:link_1) { create(:external_link) }
  let!(:link_2) { create(:external_link) }
  let(:attrs) { OpenStruct.new attributes_for(:link) }

  scenario 'index renders successfully' do
    click_on 'External Links'
    expect(page).to have_content link_1.text
    expect(page).to have_content link_2.url
  end

  scenario 'create works correctly' do
    click_on 'External Links'
    click_on 'New External Link'
    expect(page).to have_selector '#page_title', text: 'New External Link'
    fill_in 'Text', with: 'Acme'
    fill_in 'Url', with: 'http://www.acme.com'
    click_on 'Create External link'
    expect(page).to have_content 'External link was successfully created.'
  end

  scenario 'edit works correctly' do
    click_on 'External Links'
    within('tr', text: link_1.text) do
      click_on 'Edit'
    end
    fill_in 'Text', with: 'Acme, Inc.'
    click_on 'Update External link'
    expect(page).to have_content 'External link was successfully updated.'
    expect(page).to have_content 'Acme, Inc.'
  end

end
