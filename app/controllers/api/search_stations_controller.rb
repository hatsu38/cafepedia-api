module Api
  class SearchStationsController < ApplicationController
    PER = 30
    def index
      @stations = Station.search(params[:word]).joins(:shops).page(params[:page]).per(params[:per] || PER)
    end
  end
end
