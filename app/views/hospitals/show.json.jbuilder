json.extract! @hospital, :id, :name, :location, :created_at, :updated_at

json.array!(@hospital.fireflies) do | firefly |
  json.key firefly.id
  #firefly = @hospital.fireflies.first
  json.values DataTransmission.by_week([firefly.id]).map{|dt| [dt.sent_at.strftime("%Y-%m-%d"), dt.hour_meter]}

end
