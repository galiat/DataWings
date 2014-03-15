json.array!(@hospitals) do |hospital|
  json.extract! hospital, :id, :name, :location
  json.url hospital_url(hospital, format: :json)
end
