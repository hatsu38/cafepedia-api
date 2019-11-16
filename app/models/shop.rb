# frozen_string_literal: true

class Shop < ApplicationRecord
  belongs_to :main_shop
  has_many :comments

  with_options presence: true do
    validates :name
    validates :prefecture
    validates :city
    validates :other_address
    validates :access
    validates :lat
    validates :lng
    validates :is_open
  end

  scope :have_socket, ->(params) {
    where(socket: true) if params[:socket].present?
  }
  scope :have_wifi, ->(params) {
    where(wifi: true) if params[:wifi].present?
  }
  scope :have_smoking, ->(params) {
    where(smoking: true) if params[:smoking].present?
  }

  def self.cafe_list_calculated_distance(params)
    lat = params[:lat] || 35.6589568
    lng = params[:lng] || 139.7219328
    cafe_lists = where(is_open: true)
                  .have_socket(params)
                  .have_wifi(params)
                  .have_smoking(params)
                  .map(&:attributes)
    cafe_lists.map do |cafe|
      cafe['distance'] = Calculate.distance(cafe['lat'], cafe['lng'], lat, lng)
    end

    cafe_lists.sort_by { |cafe| cafe['distance'] }
  end
end
