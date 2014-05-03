class AddCountryCodeToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :country_code, :string
    Hospital.all.map &:save
  end
end
