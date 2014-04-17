class RenameDataTransmitions < ActiveRecord::Migration
  def self.up
    rename_table :data_transmitions, :data_transmissions
  end

  def self.down
    rename_table :data_transmissions, :data_transmitions
  end
end
