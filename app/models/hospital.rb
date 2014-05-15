class Hospital < DatawingsRecord
  geocoded_by :location
  validates_uniqueness_of :name
  after_validation :geocode #, :if => :address_changed?
  before_save :country_code

  has_many :fireflies

  scope :by_sponsor,  -> (sponsor){joins(fireflies: :sponsor).uniq.where('fireflies.sponsor_id' => sponsor.id)}

  def country_code
    self.country_code = attributes[:country_code] || 'US' #TODO use geocoder
  end

end
