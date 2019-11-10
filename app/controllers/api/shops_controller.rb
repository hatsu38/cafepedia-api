# frozen_string_literal: true

class Api::ShopsController < ApplicationController
  PER = 30
  def index
    @shops = Shop.all.includes(:main_shop).where(is_open: true).page(params[:page]).per(PER)
  end

  def show
    lat = params[:lat] || 35.6589568
    lng = params[:lng] || 139.7219328
    shop = Shop.find(params[:id]).attributes
    shop['distance'] = Calculate.distance(shop['lat'], shop['lng'], lat, lng)
    @shop = shop
  end

  def search
    cafe_lists = Shop.cafe_list_calculated_distance(params)
    @shops = Kaminari.paginate_array(cafe_lists).page(params[:page]).per(30)
  end
end
