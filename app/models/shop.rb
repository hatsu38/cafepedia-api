# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  id              :bigint           not null, primary key
#  access          :text
#  business_hour   :text
#  chair           :string
#  city_name       :string           not null
#  hp              :string
#  iccard          :boolean          default(FALSE)
#  is_open         :boolean          default(TRUE), not null
#  lat             :decimal(10, 7)   not null
#  lng             :decimal(11, 7)   not null
#  name            :string           not null
#  other_address   :string           not null
#  prefecture_name :string           not null
#  smoking         :boolean          default(FALSE)
#  socket          :boolean          default(FALSE)
#  tel             :string
#  wifi            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :bigint
#  main_shop_id    :bigint
#  prefecture_id   :integer          default(0), not null
#
# Indexes
#
#  index_shops_on_city_id       (city_id)
#  index_shops_on_main_shop_id  (main_shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (main_shop_id => main_shops.id)
#
class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments, dependent: :destroy
  has_many :shop_congrestion_infos, dependent: :destroy
  has_many :congrestion_infos, through: :shop_congrestion_infos
  has_many :shop_stations, dependent: :destroy
  has_many :stations, through: :shop_stations
  belongs_to :main_shop
  belongs_to :city, optional: true

  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates :prefecture_name
    validates :city_name
    validates :other_address
    validates :access
    validates :lat
    validates :lng
    validates :is_open
    validates :prefecture_id
  end
  validates :name, uniqueness: true

  scope :params_have_socket, lambda { |params|
    where(socket: true) if params[:socket].present?
  }
  scope :params_have_wifi, lambda { |params|
    where(wifi: true) if params[:wifi].present?
  }
  scope :params_have_smoking, lambda { |params|
    where(smoking: true) if params[:smoking].present?
  }
  scope :params_access_station, lambda { |params|
    where(['access LIKE ?', "%#{params[:station_name]}%"]) if params[:station_name].present?
  }

  scope :have_scocket, -> { where(socket: true) }
  scope :have_wifi, -> { where(wifi: true) }
  scope :have_smoking, -> { where(smoking: true) }
  scope :open, -> { where(is_open: true) }

  scope :access_station, lambda { |word|
    where(['access LIKE ?', "%#{word}%"])
  }

  def self.cafe_list_calculated_distance(params)
    lat = params[:lat] || 35.6589568
    lng = params[:lng] || 139.7219328
    cafe_lists = open
                 .access_station(params[:socket])
                 .params_have_socket(params)
                 .params_have_wifi(params)
                 .params_have_smoking(params)
                 .map(&:attributes)
    cafe_lists.map do |cafe|
      cafe['distance'] = Calculate.distance(cafe['lat'], cafe['lng'], lat, lng)
    end

    cafe_lists.sort_by { |cafe| cafe['distance'] }
  end
end
