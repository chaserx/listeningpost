json.array!(@devices) do |device|
  json.extract! device, :id
end
