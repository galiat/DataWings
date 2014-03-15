class Firefly < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :sponsor
  validates_uniqueness_of :device_id
  validates_presence_of :device_id

  def name
     "#{hospital.try(:name)} #{device_id}"
  end
end
