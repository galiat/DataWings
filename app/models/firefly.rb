class Firefly < DatawingsRecord
  belongs_to :hospital
  belongs_to :sponsor
  has_many :data_transmissions

  validates_uniqueness_of :device_id
  validates_presence_of :device_id

  def name
     "#{hospital.try(:name)} #{device_id}"
  end

  def location
    [hospital.latitude, hospital.longitude]
  end

  def total_hours
    data_transmissions.inject(0){|sum, dt| sum + dt.total_hours}
  end

end
