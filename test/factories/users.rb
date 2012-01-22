FactoryGirl.define do
  
  factory :user do |n|
    sequence(:email){|n| "user#{n}@example.com" }
    email_confirmation { email }
    first_name 'John'
    last_name 'Doe'
    password 'password' 
    password_confirmation 'password'
    address_attributes FactoryGirl.attributes_for(:address)
    welcomed true
  end

  factory :admin, :class => :user do
    email  'admin@example.com'
    email_confirmation 'admin@example.com' 
    first_name "Admin"
    last_name "User"
    password 'password' 
    password_confirmation 'password'
    address_attributes FactoryGirl.attributes_for(:address)
    welcomed true    
  end
end    