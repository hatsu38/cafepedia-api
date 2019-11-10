# frozen_string_literal: true

class CreateMainShops < ActiveRecord::Migration[6.0]
  def change
    create_table :main_shops do |t|
      t.string :name, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
