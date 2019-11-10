# frozen_string_literal: true

class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :other_address, null: false
      t.text :access
      t.string :tel
      t.text :business_hour
      t.string :chair
      t.string :hp
      t.boolean :wifi, default: false
      t.boolean :socket, default: false
      t.boolean :smoking, default: false
      t.boolean :iccard, default: false
      t.decimal :lat, precision: 10, scale: 7, null: false
      t.decimal :lng, precision: 11, scale: 7, null: false
      t.boolean :is_open, default: true, null: false
      t.references :main_shop, foreign_key: true

      t.timestamps
    end
  end
end
