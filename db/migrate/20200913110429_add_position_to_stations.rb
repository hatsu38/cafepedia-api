class AddPositionToStations < ActiveRecord::Migration[6.0]
  def change
    add_column :stations, :latitude, :decimal, precision: 10, scale: 7, null: false, default: 0, comment: "緯度"
    add_column :stations, :longitude, :decimal, precision: 9, scale: 7, null: false, default: 0, comment: "経度"
  end
end
