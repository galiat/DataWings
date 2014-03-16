class DataTransmition < ActiveRecord::Base
  belongs_to :firefly
  validates_presence_of :firefly_id

  def total_time
    hour_meter.nil? ? 0 : hour_meter
  end

end
