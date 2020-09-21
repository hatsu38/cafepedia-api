module Api
  module V1
    module All
      class StationsController < ApplicationController
        PER = 1000
        def index
          @stations = Station.where.not(city_id: nil)
                             .select(:id, :prefecture_id, :city_id)
                             .page(params[:page])
                             .per(params[:per] || PER)
                             .preload(:city)
        end
      end
    end
  end
end