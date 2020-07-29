module Api
  class AreasController < ApplicationController
    PER = 10
    def index
      @areas = Prefecture.all.pluck(:area).uniq
      render json: { areas: @areas }
    end

    def show
      @prefectures = Prefecture.find_all_by_area(params[:area])
    end
  end
end