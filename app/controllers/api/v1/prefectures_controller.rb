module Api::V1
  class PrefecturesController < ApplicationController
    PER = 10
    def index
      @prefectures = Prefecture.all
    end

    def show
      @prefecture = Prefecture.find_by(name_e: params[:name_e])
      @shops = @prefecture.shops.page(params[:page]).per(params[:per] || PER)
    end
  end
end