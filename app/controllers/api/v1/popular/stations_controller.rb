module Api
  module V1
    module Popular
      class StationsController < ApplicationController
        PER = 30
        def index
          @stations = Station.popular.page(params[:page]).per(params[:per] || PER)
        end
      end
    end
  end
end
