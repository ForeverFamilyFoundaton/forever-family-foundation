FactoryBot.define do
  factory :radio_archive do |n|
    format { ['The Gathering', 'Signs of Life', 'Mediums & Messages'].sample }
    date { Time.now }
    title { Faker::Lorem.sentence }
    guest { Faker::Name.name }
  end
end
