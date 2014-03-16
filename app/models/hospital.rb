class Hospital < ActiveRecord::Base
  geocoded_by :location
  validates_uniqueness_of :name
  after_validation :geocode#, :if => :address_changed?

  def total_time
  end

  def lives_saved
  end



end
