FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name "Vishal"
    last_name "Jain"
    sequence(:email) {|n| "dummy#{n}@gmail.com"}
    password "123456"
  end
end