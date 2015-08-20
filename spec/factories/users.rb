FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "me-#{n}@example.com" }
    password 'abc123xyz'
    password_confirmation 'abc123xyz'
  end
end
