class CreateShopStations < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_stations do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
