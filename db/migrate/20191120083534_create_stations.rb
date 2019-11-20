# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :kanji_name, null: false
      t.string :kana_name, null: false
    end
  end
end
