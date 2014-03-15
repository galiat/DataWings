class Sponsor < ActiveRecord::Base
  validates_uniqueness_of :name
end
