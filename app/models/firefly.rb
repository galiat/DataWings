class Firefly < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :sponsor

  def name
     "#{hospital.try(:name)} #{device_id}"
  end
end
