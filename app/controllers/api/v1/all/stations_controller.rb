module Api
  module V1
    module All
      class StationsController < ApplicationController
        def index
          @stations = Station.all.where.not(city_id: nil)
        end
      end
    end
  end
end