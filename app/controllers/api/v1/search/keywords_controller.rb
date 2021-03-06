module Api
  module V1
    module Search
      class KeywordsController < BaseController
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
          @shops = Shop.open.have_scocket.have_wifi
                       .search_name_by_keyword(params[:keyword])
                       .preload(:main_shop, :city)
                       .page(params[:page])
                       .per(params[:per] || PER)
        end
      end
    end
  end
end
