FactoryBot.define do

  factory :attached_file do
    attachment { attachment(:image, '/image.jpg', 'image/jpg') }
  end

  factory :business_card, :class => :attached_file do
    attachment { attachment(:image, '/image.jpg', 'image/jpg') }
    kind {'business_card'}
  end

  factory :business_logo, :class => :attached_file do
    attachment { attachment(:image, '/image.jpg', 'image/jpg') }
    kind {'business_logo'}
  end

  factory :web_banner, :class => :attached_file do
    attachment { attachment(:image, '/image.jpg', 'image/jpg') }
    kind {'web_banner'}
  end

  factory :promotional_media_mp3, :class => :attached_file do
    attachment { attachment(:image, '/image.jpg', 'image/jpg') }
    kind {'promotional_media_mp3'}
  end

  factory :promotional_media_upload, :class => :attached_file do
    attachment { attachment(:image, '/image.jpg', 'image/jpg') }
    kind {'promotional_media_upload'}
  end
end
