json.array!(@data_transmissions) do |data_transmission|
  json.extract! data_transmission, :id, :firefly_id, :sent_at, :hour_meter, :high_temp, :low_temp, :min_voltage, :max_voltage, :error_code
  json.url data_transmission_url(data_transmission, format: :json)
end
