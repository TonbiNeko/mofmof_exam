class CreateNearestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearest_stations do |t|
      t.text :train_line
      t.text :station_name
      t.integer :walking_time

      t.timestamps
    end
  end
end
