FactoryBot.define do
  factory :message do
    association :conversation
    body { Faker::Lorem.paragraph }
    trait :human do
      message_type { :human }
    end
    trait :ai do
      message_type { :ai }
    end
  end
end
