FactoryGirl.define do
  factory :announcement do
    sequence(:start_date) { |n| Date.today + n.days }
    sequence(:end_date) { |n| start_date + n.weeks }
    button "Conference this week"
    link "Register"
  end
end