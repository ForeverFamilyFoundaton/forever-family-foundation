FactoryBot.define do
  factory :external_link do |n|

    text { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    sequence(:sort_order) { |n| n }
  end
end
