module Api
  class PopularStationsController < ApplicationController
    PER = 30

    def index
      @stations = Station.popular.joins(:shops).page(params[:page]).per(params[:per] || PER)
    end
  end
end
