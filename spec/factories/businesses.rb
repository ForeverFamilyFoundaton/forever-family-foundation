
def image_path
  Rails.root.to_s + '/spec/fixtures/img/test.gif'
end

FactoryGirl.define do

  factory :business do |n|
    name 'New Tech'
    contact_name 'Acme Inc.'
    contact_phone '212 123 4567'
    sequence(:contact_email){ |n| "biz#{n}@example.com" }
    contact_email_confirmation { contact_email }
    address
    billing_address

    trait :step_2 do
      # business_card  { fixture_file_upload(image_path) }
      # business_logo  { fixture_file_upload(image_path) }
      # web_banner     { fixture_file_upload(image_path) }
      promotional_info_additional_notes "Description"
      use_business_card_for_web_banner { false }
    end

    trait :step_3 do
      # promotional_media_mp3 { fixture_file_upload(image_path) }
      # promotional_media_upload  { fixture_file_upload(image_path) }
      promotional_media_text 'Description'
      promotional_media_additional_notes 'Description'
    end

    factory :business_complete, traits: [:step_2, :step_3]
  end

end
