RSpec.describe Business do
  it { should have_one :address }
  it { should have_one :business_card }
  it { should have_one :business_logo }
  it { should have_one :web_banner }
  it { should have_one :promotional_media_mp3 }
  it { should have_one :promotional_media_upload }
  it { should have_one :billing_address }
  it { should have_one :billing_address }
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :contact_name }
  it { should validate_presence_of :contact_phone }
  it { should validate_presence_of :contact_email }
  it { should_not allow_mass_assignment_of :user_id   }

  [
    :address,
    :business_card,
    :business_logo,
    :web_banner,
    :promotional_media_mp3,
    :promotional_media_upload,
    :billing_address
  ].each do |association|
    it { should accept_nested_attributes_for association }
  end

end
