module Api
  module V1
    module Search
      class PositionsController < ApplicationController
        PER = 20
        def index
          @stations = NearStationsByPositionService.new.execute(35.66521320007564, 139.7300114513391)
          @city = NearCityByPositionService.new.execute(35.66521320007564, 139.7300114513391)
          @cities = @city&.same_prefecutre_other_cities.preload(:shops, :stations).page(params[:page]).per(params[:per] || PER)
          # @cities = City.search_name_by_keyword(params[:keyword])
          #               .preload(:shops, :stations)
          #               .page(params[:page])
          #               .per(params[:per] || PER)
          # @shops = Shop.open
          #             .search_name_by_keyword(params[:keyword])
          #             .preload(:main_shop, :city)
          #             .page(params[:page])
          #             .per(params[:per] || PER)
        end
      end
    end
  end
end
