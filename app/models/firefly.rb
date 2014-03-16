class Firefly < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :sponsor
  validates_uniqueness_of :device_id
  validates_presence_of :device_id
  has_many :data_transmition
  def name
     "#{hospital.try(:name)} #{device_id}"
  end

  def total_time
    data_transmition.inject(0){|sum, dt| sum + dt.total_time}
  end

  def lives_saved
    (total_time/(25 * 2.5)).round
  end
end
