module Api
  class StationsController < ApplicationController
    PER = 10

    def index
      @stations = Station.preload(:shops).page(params[:page]).per(params[:per] || 30)
    end

    def show
      @station = Station.find(params[:id])
    end

    def search
      @stations = Station.search(params[:word]).preload(:shops).page(params[:page]).per(PER)
    end
  end
end
