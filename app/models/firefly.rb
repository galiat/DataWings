class Firefly < DatawingsRecord
  belongs_to :hospital
  belongs_to :sponsor
  has_many :data_transmissions

  validates_uniqueness_of :device_id
  validates_presence_of :device_id

  scope :by_sponsor,  -> (sponsor){where('fireflies.sponsor_id' => sponsor.id)}

  def by_week
    start = data_transmissions.first.sent_at
    data_transmissions.where("sent_at >= ? and sent_at < ?", start, start+7.days)
  end

  def by_country_and_hospital
    #{countries:[{'VT' :  {hospitals: [{name: 'foo', lat: '12', long:'23' {fireflies: [{hours_on: '12', lives_saved: 'newborns treated'} ]}} ]}} ]}
  end

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
