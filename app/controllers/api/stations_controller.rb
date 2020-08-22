module Api
  class StationsController < ApplicationController
    PER = 20

    def index
      @stations = Station.eager_load(:shops).page(params[:page]).per(params[:per] || PER)
    end

    def show
      @station = Station.find(params[:id])
      @near_stations = @station.near_stations
      @shops = @station.shops.open.page(params[:page]).per(params[:per] || PER)
    end
  end
end
