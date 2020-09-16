module Api
  module V1
    module Search
      class PositionsController < ApplicationController
        PER = 20
        def index
          @stations = NearStationsByPositionService.new.execute(params[:lat], params[:lng])
          @city = NearCityByPositionService.new.execute(params[:lat], params[:lng])
          @cities = @city&.same_prefecutre_other_cities.preload(:shops, :stations).page(params[:page]).per(params[:per] || PER)
          cities_shops = Shop.open.where(city_id: @cities.pluck(:id)).eager_load(:main_shop, :city)
          shops = NearShopsByPositionService.new.execute(cities_shops, params[:lat], params[:lng])
          @shops = shops[0..50]
        end
      end
    end
  end
end
