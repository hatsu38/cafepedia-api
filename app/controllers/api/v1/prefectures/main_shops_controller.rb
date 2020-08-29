module Api
  module V1
    module Prefectures
      class MainShopsController < ApplicationController
        PER = 20
        def show
          @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
          @main_shop = MainShop.find_by(eng_name: params[:eng_name])
          @stations = @prefecture.stations.popular
          @cities = @prefecture.cities.popular
          @shops = @main_shop.shops.where(prefecture_id: @prefecture.id).open.page(params[:page]).per(params[:per] || PER)
        end
      end
    end
  end
end
