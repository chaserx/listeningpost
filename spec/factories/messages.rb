FactoryGirl.define do
  factory :message do
    device
    body { ('a'..'z').to_a.shuffle.join }
  end
end

