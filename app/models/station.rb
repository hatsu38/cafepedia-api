# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id            :bigint           not null, primary key
#  kana_name     :string           not null
#  kanji_name    :string           not null
#  created_at    :datetime         default(Wed, 23 Sep 2020 11:19:02 JST +09:00), not null
#  updated_at    :datetime         default(Wed, 23 Sep 2020 11:19:02 JST +09:00), not null
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

  validates :kana_name, presence: true
  validates :kanji_name, presence: true

  delegate :name_e, to: :prefecture, prefix: true
  delegate :code, to: :city, prefix: true

  scope :have_socket_and_wifi_shops, -> {
    eager_load(:shops).where(shops: { wifi: true, socket: true})
  }

  def self.search(word = nil)
    search_word = word.present? && word != '駅' ? "%#{word}%" : ''
    where('kanji_name LIKE :word OR kana_name LIKE :word', word: search_word)
  end

  def self.popular(limit: 20)
    joins(:shops).where(shops: { wifi: true, socket: true}).group(:id).order('COUNT(shops.id) DESC').preload(:shops).limit(limit)
  end

  def same_city_other_stations
    city.stations.have_socket_and_wifi_shops.where.not(id: self)
  end

  def nearby_stations
    near_stations || same_city_other_stations
  end

  def eki_except_from_kanji_name
    kanji_name.end_with?('駅') ? kanji_name.chop : kanji_name
  end
end
