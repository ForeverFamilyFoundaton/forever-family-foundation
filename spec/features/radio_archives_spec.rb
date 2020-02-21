RSpec.feature 'As a guest' do
  context 'requesting a non-existent RadioArchive' do
    before do
      visit radio_archive_path('Foo')
    end

    scenario 'I am redirected to the :index page' do
      expect(page).to have_content "Couldn't find"
      expect(page).to have_content 'Radio Archives'
    end
  end
end
