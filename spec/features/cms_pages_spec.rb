RSpec.feature 'CMS Pages' do
  let(:cms_page) { FactoryBot.create(:cms_page) }

  before do
    cms_page
  end

  scenario 'are available by an :id in the route' do
    visit "/site/page/#{cms_page.id}"
    expect(page).to have_content cms_page.title
  end
end
