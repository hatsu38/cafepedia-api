# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id         :bigint           not null, primary key
#  kana_name  :string           not null
#  kanji_name :string           not null
#
class Station < ApplicationRecord
  extend OrderAsSpecified
  validates :kana_name, presence: true
  validates :kanji_name, presence: true
  has_many :shop_stations, dependent: :destroy
  has_many :shops, through: :shop_stations

  def self.search(word)
    where('kanji_name LIKE :word OR
      kana_name LIKE :word', word: "%#{word}%")
  end

  def self.popular(limit = 50)
    ids = ShopStation.group(:station_id).order('count_all desc').count.keys[0..limit]
    self.where(id: ids).order_as_specified(id: ids)
  end
end
