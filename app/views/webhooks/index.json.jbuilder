json.array!(@webhooks) do |webhook|
  json.extract! webhook, :id
  json.url webhook_url(webhook, format: :json)
end
