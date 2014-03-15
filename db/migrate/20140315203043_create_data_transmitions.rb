class CreateDataTransmitions < ActiveRecord::Migration
  def change
    create_table :data_transmitions do |t|
      t.references :firefly, index: true
      t.datetime :sent_at
      t.integer :hour_meter
      t.integer :high_temp
      t.integer :low_temp
      t.integer :min_voltage
      t.integer :max_voltage
      t.string :error_code

      t.timestamps
    end
  end
end
