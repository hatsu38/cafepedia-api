module Api
  class StationsController < ApplicationController
    PER = 10
    def search
      @stations = Station.search(params[:word]).page(params[:page]).per(PER)
    end
  end
end
