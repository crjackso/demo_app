FactoryGirl.define do
  factory :participant do
    first_name    "John"
    last_name     "Doe"
    email         "jdoe@test.net"
    country_code  "United States"
    microsite
    #association :microsite, factory: :microsite #, name: "Writely"
  end
end