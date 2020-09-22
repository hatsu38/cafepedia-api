module Api
  module V1
    module Prefectures
      module Cities
        class StationsController < BaseController
          before_action :set_address

          PER = 20
          def show
            @station = @city.stations.find_by!(id: params[:id])
            @stations = @station.nearby_stations.popular.preload(:city)
            @cities = @city.same_prefecutre_other_cities.popular
            @main_shops = MainShop.popular
            @shops = @station.shops.open.have_scocket.have_wifi.page(params[:page]).per(params[:per] || PER)
          end

          private

          def set_address
            @prefecture = Prefecture.find_by!(name_e: params[:prefecture_name_e])
            @city = @prefecture.cities.find_by!(code: params[:city_code])
          end
        end
      end
    end
  end
end
