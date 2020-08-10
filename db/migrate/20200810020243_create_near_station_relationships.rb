class CreateNearStationRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :near_station_relationships do |t|
      t.integer :main_station_id, null: false
      t.integer :near_station_id, null: false

      t.timestamps
    end
    add_index :near_station_relationships, :main_station_id
    add_index :near_station_relationships, :near_station_id
    add_index :near_station_relationships, [:main_station_id, :near_station_id], unique: true, name: 'index_main_station_and_near_station'
  end
end
