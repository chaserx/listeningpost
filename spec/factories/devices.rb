FactoryGirl.define do
  factory :device do
    sequence(:name) { |n| "device-#{n}" }
  end
end
