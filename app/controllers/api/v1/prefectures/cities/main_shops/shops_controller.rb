module Api
  module V1
    module Prefectures
      module Cities
        module MainShops
          class ShopsController < ApplicationController
            before_action :set_commons_instance

            PER = 20
            def index
              @stations = @city.stations.popular
              @shops = @city.shops
                            .open
                            .where(main_shop_id: @main_shop.id)
                            .eager_load(:main_shop)
                            .page(params[:page])
                            .per(params[:per] || PER)
            end

            def show
              @shop = @city.shops
                           .open
                           .where(main_shop_id: @main_shop.id)
                           .eager_load(:main_shop)
                           .find_by(id: params[:id])
              @station = @shop.stations.first
              @stations = @station.near_stations.popular
            end

            private

            def set_commons_instance
              @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
              @city = @prefecture.cities.find_by(code: params[:city_code])
              @main_shop = MainShop.find_by(eng_name: params[:main_shop_eng_name])
            end
          end
        end
      end
    end
  end
end