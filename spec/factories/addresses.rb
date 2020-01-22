FactoryBot.define do
  factory :address do |n|
    sequence(:address) { |n| "#{n} Fake St." }
    city {"New York"}
    state {"NY"}
    zip {"10036"}
    country {"USA"}
  end
end
