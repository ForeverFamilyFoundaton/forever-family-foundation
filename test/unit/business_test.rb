require_relative '../test_helper'

class BusinessTest < ActiveSupport::TestCase
  should have_one :address
  should have_one :business_card
  should have_one :business_logo
  should have_one :web_banner
  should have_one :promotional_media_mp3
  should have_one :promotional_media_upload
  should have_one :billing_address
  should have_one :billing_address
  should belong_to :user

  should validate_presence_of :name
  should validate_presence_of :contact_name
  should validate_presence_of :contact_phone
  should validate_presence_of :contact_email

  should_not allow_mass_assignment_of :user_id  
   
  should "validate confirmation of contact email" do
    assert FactoryGirl.create(:business).respond_to?(:contact_email_confirmation)
  end

  [:address, :business_card, :business_logo, :web_banner, :promotional_media_mp3, 
                                            :promotional_media_upload, :billing_address].each do |association|
    should "accepts nested attributes for #{association}" do
      assert FactoryGirl.create(:business).respond_to?(:"#{association}_attributes=")
    end
  end
 
end
