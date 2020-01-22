FactoryBot.define do
  factory :preference do
    name {"Please send me the benefits"}
  end

  factory :preference_email, :class => :preference do
    name {"I want to receive email newsletters"}
    preference_type {"Profile"}
  end

  factory :preference_active_role, :class => :preference do
    name {"I would like to take active role in work on the foundation"}
    preference_type {"Profile"}
  end

  factory :preference_adg, :class => :preference do
    name {"If there is not yet a group in my area, please keep the information and notify me as soon as a group is
   formed"}
    preference_type {"ADG"}
  end

  factory :preference_adg_2, :class => :preference do
    name {"Please contact me about the requirements of becoming an ADG facilitator"}
    preference_type {"ADG"}
  end
end
