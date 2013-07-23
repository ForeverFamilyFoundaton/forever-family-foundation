require 'spec_helper'

describe RadioArchivesController do
  setup_user

  it "orders by date" do
    create(:radio_archive, date: 2.weeks.ago)
    create(:radio_archive, date: 1.week.ago)
    get :index
    assigns[:archives].first.date.end_of_day.should eq 1.week.ago.end_of_day
  end

  it 'paginates' do
    RadioArchive.should_receive(:page).and_call_original
    get :index
  end
end
