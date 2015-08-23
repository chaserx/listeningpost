FactoryGirl.define do
  factory :device do
    user
    sequence(:name) { |n| "device-#{n}" }
  end
end
