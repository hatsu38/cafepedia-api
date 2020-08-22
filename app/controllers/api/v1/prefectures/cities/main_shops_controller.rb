# frozen_string_literal: true

module Api::V1::Prefectures::Cities
  class MainShopsController < ApplicationController
    PER = 20
    def index
      @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
      @city = City.where(prefecture_id: @prefecture.id).find_by(city_code: params[:city_code])
      @shops = Shop.where(prefecture_id: @prefecture.id).eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
      @main_shops = MainShop.eager_load(:shops)
    end

    def show
      @main_shop = MainShop.find(params[:id])
      @shops = @main_shop.shops.where(is_open: true).page(params[:page]).per(params[:per] || PER)
    end
  end
end
