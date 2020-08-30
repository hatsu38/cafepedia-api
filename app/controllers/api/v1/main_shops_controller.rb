module Api
  module V1
    class MainShopsController < ApplicationController
      PER = 20
      def show
        @main_shop = MainShop.find_by(eng_name: params[:eng_name])
        @prefectures = Prefecture.popular
        @stations = Station.popular.preload(:city).page(params[:page]).per(params[:per] || PER)
        @shops = @main_shop.shops.open.page(params[:page]).per(params[:per] || PER)
      end
    end
  end
end
