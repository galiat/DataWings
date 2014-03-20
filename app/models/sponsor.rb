class Sponsor < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :fireflies

  def total_hours
      fireflies.inject(0){|sum, ff| sum + ff.total_hours}
  end

  def newborns_treated
    (total_hours/(24 * 2.5)).round
  end
end
