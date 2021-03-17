FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "Description"
    due_on 3.days.from_now
    association :owner

    trait :due_yesterday do
      due_on 1.day.ago
    end

    trait :due_tomorrow do
      due_on 1.day.from_now
    end

  end
end