class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :city_code, null: false
      t.integer :prefecture_id, null: false, default: 0

      t.timestamps
    end
    add_index :cities, :city_code, unique: true
  end
end
