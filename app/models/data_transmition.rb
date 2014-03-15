class DataTransmition < ActiveRecord::Base
  belongs_to :firefly
  validates_presence_of :firefly_id
end
