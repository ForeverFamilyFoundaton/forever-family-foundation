RSpec.describe SiteController do
	it 'renders cms pages by id' do
		@cms_page = CmsPage.create! reference_string: 'Test Page', title: 'Test'
		get :page, params: { id: @cms_page.id }
		expect(response).to render_template(:page)
	end
end
