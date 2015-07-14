json.array!(@callbacks) do |callback|
  json.extract! callback, :id, :url, :device_id
  json.url callback_url(callback, format: :json)
end
