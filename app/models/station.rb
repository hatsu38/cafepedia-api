# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id            :bigint           not null, primary key
#  kana_name     :string           not null
#  kanji_name    :string           not null
#  created_at    :datetime         default(Wed, 26 Aug 2020 14:30:52 JST +09:00), not null
#  updated_at    :datetime         default(Wed, 26 Aug 2020 14:30:52 JST +09:00), not null
#  city_id       :bigint
#  prefecture_id :integer          default(48), not null
#
# Indexes
#
#  index_stations_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
class Station < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  extend OrderAsSpecified

  validates :kana_name, presence: true
  validates :kanji_name, presence: true

  has_many :shop_stations, dependent: :destroy
  has_many :shops, through: :shop_stations
  has_many :near_station_reloations,
           foreign_key: :main_station_id,
           class_name: 'NearStationRelationship',
           inverse_of: :main_station,
           dependent: :destroy
  has_many :main_station_reloations,
           foreign_key: :near_station_id,
           class_name: 'NearStationRelationship',
           inverse_of: :near_station,
           dependent: :destroy
  has_many :near_stations, through: :near_station_reloations
  has_many :main_stations, through: :main_station_reloations
  belongs_to :city, optional: true
  belongs_to_active_hash :prefecture

  def self.search(word)
    where('kanji_name LIKE :word OR kana_name LIKE :word', word: "%#{word}%")
  end

  def self.popular_as_parts(limit: 20, station_ids: [])
    ids = ShopStation.where(station_id: station_ids).group(:station_id).order('count_all desc').count.keys[0..limit]
    where(id: ids).order_as_specified(id: ids)
  end

  def self.popular_in_whole(limit: 50)
    ids = ShopStation.group(:station_id).order('count_all desc').count.keys[0..limit]
    where(id: ids).order_as_specified(id: ids)
  end
end
