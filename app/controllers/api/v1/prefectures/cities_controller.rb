module Api
  module V1
    module Prefectures
      class CitiesController < ApplicationController
        before_action :set_pfefecture

        PER = 10
        def index
          @cities = @prefecture.cities.eager_load(:shops)
          @shops = @prefecture.shops.open.eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
        end

        def show
          @city = @prefecture.cities.find_by(code: params[:code])
          @shops = @city.shops.open.eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
        end

        private

        def set_pfefecture
          @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
        end
      end
    end
  end
end