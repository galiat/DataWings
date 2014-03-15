json.array!(@fireflies) do |firefly|
  json.extract! firefly, :id, :device_id, :hospital_id, :sponsor_id
  json.url firefly_url(firefly, format: :json)
end
