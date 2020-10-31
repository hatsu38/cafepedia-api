module Api
  module V1
    module Prefectures
      class CitiesController < BaseController
        before_action :set_pfefecture

        PER = 10
        def index
          @cities = @prefecture.cities.popular
          @shops = @prefecture.shops
                              .open
                              .have_scocket
                              .have_wifi
                              .eager_load(:main_shop, :city)
                              .page(params[:page])
                              .per(params[:per] || PER)
        end

        def show
          @city = @prefecture.cities.find_by!(code: params[:code])
          @stations = @city.stations.popular.preload(:city)
          @cities = @prefecture.cities.popular
          @main_shops = MainShop.popular.where(shops: {city_id: @city.id})
          @shops = @city.shops
                        .open
                        .have_scocket
                        .have_wifi
                        .eager_load(:main_shop)
                        .page(params[:page])
                        .per(params[:per] || PER)
        end

        private

        def set_pfefecture
          @prefecture = Prefecture.find_by!(name_e: params[:prefecture_name_e])
        end
      end
    end
  end
end