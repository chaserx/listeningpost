FactoryGirl.define do
  factory :webhook do
    device
    sequence :url do |n|
      "http://example.com/#{n}"
    end
    request_type 'POST'
  end
end
