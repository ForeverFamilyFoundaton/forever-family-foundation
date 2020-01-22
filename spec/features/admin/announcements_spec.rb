RSpec.feature 'ADMIN: Announcements' do

  before { sign_in_as_admin }

  let(:business) { create(:business_complete ) }
  let(:user) { create(:user, business: business) }

  it "successfully creates new announcement" do
    user
    click_link 'Announcements'
    click_link 'New Announcement'
    fill_in 'Body', with: 'Test Body 1'
    fill_in 'announcement_link', with: 'http://test_site.com'
    fill_in 'announcement_button', with: 'Click here'
    select '2016', from: 'announcement[start_date(1i)]'
    select 'January', from: 'announcement[start_date(2i)]'
    select '1', from: 'announcement[start_date(3i)]'
    select '2016', from: 'announcement[end_date(1i)]'
    select 'January', from: 'announcement[end_date(2i)]'
    select '20', from: 'announcement[end_date(3i)]'
    click_on 'Create Announcement'

    expect(page).to have_content('Announcement was successfully created')
  end


  it "fails announcements with overlapping end date" do
    user
    click_link 'Announcements'
    click_link 'New Announcement'
    fill_in 'Body', with: 'Test Body 1'
    fill_in 'announcement_link', with: 'http://test_site.com'
    fill_in 'announcement_button', with: 'Click here'
    select '2016', from: 'announcement[start_date(1i)]'
    select 'January', from: 'announcement[start_date(2i)]'
    select '1', from: 'announcement[start_date(3i)]'
    select '2016', from: 'announcement[end_date(1i)]'
    select 'January', from: 'announcement[end_date(2i)]'
    select '20', from: 'announcement[end_date(3i)]'
    click_on 'Create Announcement'

    click_link 'Announcements'
    click_link 'New Announcement'
    fill_in 'Body', with: 'Test Body 1'
    fill_in 'announcement_link', with: 'http://test_site.com'
    fill_in 'announcement_button', with: 'Click here'
    select '2016', from: 'announcement[start_date(1i)]'
    select 'January', from: 'announcement[start_date(2i)]'
    select '15', from: 'announcement[start_date(3i)]'
    select '2016', from: 'announcement[end_date(1i)]'
    select 'January', from: 'announcement[end_date(2i)]'
    select '25', from: 'announcement[end_date(3i)]'
    click_on 'Create Announcement'

    expect(page).to have_content('New Announcement Conflicts with other Announcements')
  end
end
