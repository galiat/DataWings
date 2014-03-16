class AddColToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :latitude, :float
    add_column :hospitals, :longitude, :float
  end
end
