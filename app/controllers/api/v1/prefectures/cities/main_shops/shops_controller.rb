module Api
  module V1
    module Prefectures
      module Cities
        module MainShops
          class ShopsController < ApplicationController
            before_action :set_commons_instance

            PER = 20
            def index
              @stations = @city.stations.popular.preload(:city)
              filted_shops = @city.shops.open.where(main_shop_id: @main_shop.id)
              @shops = filted_shops.page(params[:page]).per(params[:per] || PER)
            end

            def show
              filted_shops = @city.shops.open.where(main_shop_id: @main_shop.id)
              @shop = filted_shops.find_by(id: params[:id])
              @shops = filted_shops.where.not(id: @shop.id).eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
              @station = @shop.stations.first
              staions = @station ? @station.nearby_stations : @city.stations
              @stations = staions.popular.preload(:city)
            end

            private

            def set_commons_instance
              @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
              @city = @prefecture.cities.find_by(code: params[:city_code])
              @cities = @city.same_prefecutre_other_cities.popular
              @main_shop = MainShop.find_by(eng_name: params[:main_shop_eng_name])
            end
          end
        end
      end
    end
  end
end