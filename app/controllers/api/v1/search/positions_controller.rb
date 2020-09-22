module Api
  module V1
    module Search
      class PositionsController < BaseController
        PER = 20
        def index
          @stations = NearStationsByPositionService.new.execute(params[:lat], params[:lng])
          @city = NearCityByPositionService.new.execute(params[:lat], params[:lng])
          @cities = @city.same_prefecutre_other_cities
                         .preload(:shops, :stations)
                         .page(params[:page])
                         .per(params[:per] || PER)
          cities_shops = Shop.open
                             .have_scocket
                             .have_wifi
                             .where(city_id: [@city.id, @cities.pluck(:id)].flatten)
                             .eager_load(:main_shop, :city)
          shops = NearShopsByPositionService.new.execute(cities_shops, params[:lat], params[:lng])
          @shops = shops[0..50]
        end
      end
    end
  end
end
