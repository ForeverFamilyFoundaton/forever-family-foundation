FactoryBot.define do
  factory :admin_user_empty do
  end
  factory :admin_user do
    email { "example@email.com" }
    password { "password" }
  end
end
