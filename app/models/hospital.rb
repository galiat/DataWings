class Hospital < ActiveRecord::Base
  geocoded_by :location
  validates_uniqueness_of :name
  after_validation :geocode#, :if => :address_changed?

  def total_hours
  end

  def newborns_treated
  end



end
