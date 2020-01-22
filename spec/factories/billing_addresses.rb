FactoryBot.define do
  factory :billing_address do |n|
    sequence(:address){|n| "#{n} Billings St." }
    city {"New York"}
    state {"NY"}
    zip {"10036"}
    country {"US"}
  end
end
