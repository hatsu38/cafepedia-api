class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.integer :prefecture_id, null: false, default: 0

      t.timestamps
    end
    add_index :cities, :code, unique: true
  end
end
