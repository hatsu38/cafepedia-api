class AddAreaToStations < ActiveRecord::Migration[6.0]
  def change
    add_reference :stations, :city, foreign_key: true, index: true
    add_column :stations, :prefecture_id, :integer, null: false, default: 48
    add_column :stations, :created_at, :datetime, null: false, default: Time.zone.now
    add_column :stations, :updated_at, :datetime, null: false, default: Time.zone.now
  end
end
