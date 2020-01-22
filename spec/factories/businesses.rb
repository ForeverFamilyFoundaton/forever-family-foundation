
def image_path
  Rails.root.to_s + '/spec/fixtures/img/test.gif'
end

FactoryBot.define do

  factory :business do |n|
    name {'New Tech'}
    contact_name {'Acme Inc.'}
    contact_phone {'212 123 4567'}
    sequence(:contact_email){ |n| "biz#{n}@example.com" }
    contact_email_confirmation { contact_email }
    address
    billing_address

    trait :step_2 do
      business_card  {
        AttachedFile.create(
          attachment: Rack::Test::UploadedFile.new(image_path), kind: 'business_card'
        )
      }
      business_logo {
        AttachedFile.create(
          attachment: Rack::Test::UploadedFile.new(image_path),
          kind: 'business_logo'
        )
      }
      web_banner {
        AttachedFile.create(
          attachment: Rack::Test::UploadedFile.new(image_path),
          kind: 'web_banner'
        )
      }
      promotional_info_additional_notes {"Description"}
      use_business_card_for_web_banner { false }
    end

    trait :step_3 do
      promotional_media_mp3 {
        AttachedFile.create(
          attachment: Rack::Test::UploadedFile.new(image_path),
          kind: 'promotional_media_mp3'
        )
      }
      promotional_media_upload {
        AttachedFile.create(
          attachment: Rack::Test::UploadedFile.new(image_path),
          kind: 'promotional_media_upload'
        )
      }
      promotional_media_text {'Description'}
      promotional_media_additional_notes {'Description'}
    end

    factory :business_complete, traits: [:step_2, :step_3]
  end

end
