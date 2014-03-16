class Sponsor < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :fireflies

  def total_time
      fireflies.inject(0){|sum, ff| sum + ff.total_time}
  end

  def lives_saved
    (total_time/(24 * 2.5)).round
  end
end
