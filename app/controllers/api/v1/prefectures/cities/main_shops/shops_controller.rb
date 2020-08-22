module Api::V1::Prefectures::Cities::MainShops
  class ShopsController < ApplicationController
    before_action :set_commons_instance

    PER = 20
    def index
      @shops = @city.shops.open.where(main_shop_id: @main_shop.id).page(params[:page]).per(params[:per] || PER)
    end

    def show
      @shop = @city.shops.open.where(main_shop_id: @main_shop.id).find_by(id: params[:id])
    end

    private

    def set_commons_instance
      @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
      @city = @prefecture.cities.find_by(code: params[:city_code])
      @main_shop = MainShop.find_by(eng_name: params[:main_shop_eng_name])
    end
  end
end