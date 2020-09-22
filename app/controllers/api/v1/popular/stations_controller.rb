module Api
  module V1
    module Popular
      class StationsController < BaseController
        PER = 30
        def index
          @stations = Station.popular.preload(:city).page(params[:page]).per(params[:per] || PER)
        end
      end
    end
  end
end
