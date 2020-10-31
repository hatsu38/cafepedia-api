module Api
  module V1
    module Popular
      class CitiesController < BaseController
        PER = 30
        def index
          @cities = City.popular.page(params[:page]).per(params[:per] || PER)
        end
      end
    end
  end
end
