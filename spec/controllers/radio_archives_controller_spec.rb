RSpec.describe RadioArchivesController do
  setup_user

  it "orders by date" do
    create(:radio_archive, date: 2.weeks.ago)
    create(:radio_archive, date: 1.week.ago)
    get :index
    expect(assigns[:archives].first.date.end_of_day).to eq(1.week.ago.end_of_day)
  end

  it 'paginates' do
    expect(RadioArchive).to receive(:page).and_call_original
    get :index
  end

  it "searches" do
    create(:radio_archive, title: "The polar bear")
    get :index, params: { q: "[title_or_guest_cont]=The polar bear" }
    expect(assigns[:archives].first.title).to eq("The polar bear")
  end
end
