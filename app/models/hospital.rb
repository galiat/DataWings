class Hospital < ActiveRecord::Base
  validates_uniqueness_of :name

  def total_time
  end

  def lives_saved
  end
end
