  class DatawingsRecord < ActiveRecord::Base
      self.abstract_class = true

      def newborns_treated
        (total_hours/(24 * 1.5)).round
      end

      def total_hours
        fireflies.inject(0){|sum, ff| sum + ff.total_hours}
      end
  end