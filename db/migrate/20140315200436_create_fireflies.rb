class CreateFireflies < ActiveRecord::Migration
  def change
    create_table :fireflies do |t|
      t.string :device_id
      t.references :hospital, index: true
      t.references :sponsor, index: true

      t.timestamps
    end
  end
end
