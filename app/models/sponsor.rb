class Sponsor < DatawingsRecord
  validates_uniqueness_of :name
  has_many :fireflies
end
