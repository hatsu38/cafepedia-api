# frozen_string_literal: true

module Api
  class ShopsController < ApplicationController
    PER = 15
    def index
      @shops = Shop.includes(:main_shop).where(is_open: true).page(params[:page]).per(PER)
    end

    def show
      lat = params[:lat] || 35.6589568
      lng = params[:lng] || 139.7219328
      shop = Shop.find(params[:id]).attributes
      shop['distance'] = Calculate.distance(shop['lat'], shop['lng'], lat, lng)
      @shop = shop
      @main_shop = Shop
                   .includes(:main_shop)
                   .where(id: shop['id'])
                   .pluck('main_shops.name',
                          'main_shops.eng_name',
                          'main_shops.image')
    end

    def search
      cafe_lists = Shop.cafe_list_calculated_distance(params)
      @shops = Kaminari.paginate_array(cafe_lists).page(params[:page]).per(PER)
      @main_shops = Shop
                    .includes(:main_shop)
                    .where(id: @shops.map { |c| c['id'] })
                    .pluck(:id, 'main_shops.name', 'main_shops.eng_name', 'main_shops.image')
    end
  end
end
