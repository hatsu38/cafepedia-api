module Api
  module V1
    module Popular
      class StationsController < ApplicationController
        PER = 30
        def index
          @stations = Station.popular_in_whole.eager_load(:shops).page(params[:page]).per(params[:per] || PER)
        end
      end
    end
  end
end
