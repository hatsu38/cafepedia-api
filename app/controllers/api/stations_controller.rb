module Api
  class StationsController < ApplicationController
    PER = 10

    def index
      @stations = Station.eager_load(:shops).page(params[:page]).per(params[:per] || 30)
    end

    def show
      @station = Station.find(params[:id])
    end
  end
end
