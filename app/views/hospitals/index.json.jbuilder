json.array!(@hospitals) do |hospital|
  json.extract! hospital, :id, :name, :location
  json.url hospital_url(hospital, format: :json)
end

json.array!(@hospitals) do |hospital|
  json.key hospital.name
  json.values []
end
