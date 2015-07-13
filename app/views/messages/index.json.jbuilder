json.array!(@messages) do |message|
  json.extract! message, :id, :body, :device_id
end
