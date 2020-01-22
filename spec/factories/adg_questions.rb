FactoryBot.define do
  factory :adg_question, :class => :adg_question do
    question {"Do you belive in GOD?"}
    show_radio {true}
  end

  factory :first_adg_question, :class => :adg_question do
    question {"Have you lost someone close to you?"}
    show_radio {true}
  end

  factory :second_adg_question, :class => :adg_question do
    question {"What specific topics are you interested in discussing?"}
    show_radio {false}
  end

  factory :third_adg_question, :class => :adg_question do
  question {"Do you believe that there is something that survives after physical death?"}
    show_radio {true}
  end


end
