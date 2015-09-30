FactoryGirl.define do
  factory :announcement_empty do

  end
  factory :announcement do
  	start_date { Date.today }
    end_date { Date.today + 1.weeks }
    #sequence(:start_date) { |n| Date.today + n.days}
    #sequence(:end_date) { |n| Date.today + n.weeks }

    body "Conference this week"
    button "Sign up"
    link "http://google.com"
  end
end