module Api::V1::Prefectures
  class CitiesController < ApplicationController
    PER = 10
    def index
      @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
      @cities = @prefecture.cities.eager_load(:shops)
      @shops = Shop.where(prefecture_id: @prefecture.id).eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
    end

    def show
      @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
      @city = City.where(prefecture_id: @prefecture.id).find_by(city_code: params[:city_code])
      @shops = @city.shops.eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
    end
  end
end