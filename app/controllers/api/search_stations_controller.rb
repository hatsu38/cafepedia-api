module Api
  class SearchStationsController < ApplicationController
    PER = 30
    def index
      @stations = Station.search(params[:word]).eager_load(:shops).page(params[:page]).per(params[:per] || PER)
    end
  end
end
