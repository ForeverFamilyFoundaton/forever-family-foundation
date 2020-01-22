FactoryBot.define do
  factory :event do
    sequence(:start_time) { |n| Time.now + n.days }
    sequence(:end_time) { |n| Time.now + 1.hour }
    title {"Hello World"}
    description {"Lorem ipsum dolor sit amet"}
    url {"awesome.com"}
  end
end
