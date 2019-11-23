# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name, null: false, default: '名無しさん'
      t.string :content, null: false
      t.boolean :is_complete, default: false
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
