class Sponsor < DatawingsRecord
  validates_uniqueness_of :name
  has_many :fireflies

  def hospitals
    Hospital.by_sponsor(self)
  end
end
