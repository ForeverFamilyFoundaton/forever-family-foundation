RSpec.feature 'As a authenticated User' do
  let(:user) { users(:homer) }
  let(:first_name) { Faker::Name.first_name }
  let(:middle_name) { Faker::Name.middle_name }
  let(:last_name) { Faker::Name.last_name }
  let(:cell_phone) { Faker::PhoneNumber.phone_number }
  let(:home_phone) { Faker::PhoneNumber.phone_number }
  let(:work_phone) { Faker::PhoneNumber.phone_number }
  let(:address) do
    {
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip
    }
  end

  before do
    login_as user, scope: :user
    visit user_path(user)
  end

  scenario 'I can edit my profile information', :chrome do
    within '.personal-information' do
      find('a.edit').click
    end
    fill_in 'First name', with: first_name
    fill_in 'Middle name', with: middle_name
    fill_in 'Last name', with: last_name
    fill_in 'Cell phone', with: cell_phone
    fill_in 'Home phone', with: home_phone
    fill_in 'Work phone', with: work_phone
    fill_in 'Street', with: address[:street]
    fill_in 'City', with: address[:city]
    fill_in 'State', with: address[:state]
    fill_in 'Zip', with: address[:zip]
    click_on 'Update'
    expect(page).to have_content first_name
    expect(page).to have_content middle_name
    expect(page).to have_content last_name
    expect(page).to have_content cell_phone.phony_formatted(normalize: :US)
    expect(page).to have_content home_phone.phony_formatted(normalize: :US)
    expect(page).to have_content work_phone.phony_formatted(normalize: :US)
    expect(page).to have_content address[:street]
    expect(page).to have_content address[:city]
    expect(page).to have_content address[:state]
    expect(page).to have_content address[:zip]
  end
end
