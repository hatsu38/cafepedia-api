module Api
  class PrefecturesController < ApplicationController
    PER = 10
    def index
      @prefectures = Prefecture.all
    end

    def show
      @prefecture = Prefecture.find(params[:id])
      @shops = @prefecture.shops.page(params[:page]).per(params[:per] || PER)
    end
  end
end