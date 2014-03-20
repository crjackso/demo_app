FactoryGirl.define do
  factory :participant do
    first_name    "John"
    last_name     "Doe"
    email         "jdoe@test.net"
    country_code  "United States"
    association :microsite, strategy: :build

    trait :with_microsite do
      microsite
    end
  end
end