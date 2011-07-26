FactoryGirl.define do
  
  factory :business do |n|
    name 'New Tech'
    contact_name "Acme Inc."
    contact_phone "212 123 4567"
    sequence(:contact_email){ |n| "biz#{n}@example.com" }
    contact_email_confirmation { contact_email }
    address
    billing_address
  end

  factory :business_step_2, :class => :business do
    business_card  { attachment(:image, '/image.jpg', 'image/jpg') } 
    business_logo  { attachment(:image, '/image.jpg', 'image/jpg') } 
    web_banner     { attachment(:image, '/image.jpg', 'image/jpg') } 
    promotional_info_additional_notes "Description"
    use_business_card_for_web_banner { false }
  end

  factory :business_step_3, :class => :business do
    promotional_media_mp3 { attachment(:image, '/image.jpg', 'image/jpg') } 
    promotional_media_upload  { attachment(:image, '/image.jpg', 'image/jpg') } 
    promotional_media_text "Description"
    promotional_media_additional_notes "Description"
  end
end