FactoryGirl.define do
  factory :announcement do
    sequence(:start_date) { |n| Date.today + n.days }
    sequence(:end_date) { |n| start_date + n.weeks }
    body "Conference this week"
    button "Sign up"
    link "http://google.com"
  end
end