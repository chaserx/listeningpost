FactoryGirl.define do
  factory :message do
    device
    sequence :ip_address do |n|
      "10.0.1.#{n}"
    end
    body { ('a'..'z').to_a.shuffle.join }
  end
end
