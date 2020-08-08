module Api
  class SearchStationsController < ApplicationController
    def index
      @stations = Station.search(params[:word]).preload(:shops).page(params[:page]).per(PER)
    end
  end
end
