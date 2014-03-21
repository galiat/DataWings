class Hospital < DatawingsRecord
  geocoded_by :location
  validates_uniqueness_of :name
  after_validation :geocode#, :if => :address_changed?

  has_many :fireflies



end
