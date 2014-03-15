json.array!(@data_transmitions) do |data_transmition|
  json.extract! data_transmition, :id, :firefly_id, :sent_at, :hour_meter, :high_temp, :low_temp, :min_voltage, :max_voltage, :error_code
  json.url data_transmition_url(data_transmition, format: :json)
end
