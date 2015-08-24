FactoryGirl.define do
  factory :webhook do
    device
    user
    sequence :url do |n|
      "http://example.com/#{n}"
    end
    request_type 'POST'
    message_body 'lorem ipsum'
  end
end
