# frozen_string_literal: true

module Api::V1::Prefectures::Cities
  class MainShopsController < ApplicationController
    PER = 20
    def index
      @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
      @city = @prefecture.cities.find_by(city_code: params[:city_code])
      @shops = @city.shops.open.eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
      @main_shops = MainShop.eager_load(:shops)
    end

    def show
      @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
      @city = @prefecture.cities.find_by(city_code: params[:city_code])
      @main_shop = MainShop.find_by(eng_name: params[:eng_name])
      @shops = @city.shops.open.where(main_shop_id: @main_shop.id).page(params[:page]).per(params[:per] || PER)
    end
  end
end
