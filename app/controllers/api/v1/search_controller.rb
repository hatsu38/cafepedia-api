module Api
  module V1
    class SearchController < ApplicationController
      PER = 20
      def index
        @stations = Station.search(params[:keyword])
                           .preload(:city, :shops)
                           .page(params[:page])
                           .per(params[:per] || PER)
        @cities = City.search_name_by_keyword(params[:keyword])
                      .preload(:shops, :stations)
                      .page(params[:page])
                      .per(params[:per] || PER)
        @shops = Shop.open
                     .search_name_by_keyword(params[:keyword])
                     .preload(:main_shop, :city)
                     .page(params[:page])
                     .per(params[:per] || PER)
      end
    end
  end
end
