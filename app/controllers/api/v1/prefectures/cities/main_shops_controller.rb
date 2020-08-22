module Api
  module V1
    module Prefectures
      module Cities
        class MainShopsController < ApplicationController
          before_action :set_address

          PER = 20
          def index
            @shops = @city.shops.open.eager_load(:main_shop).page(params[:page]).per(params[:per] || PER)
            @main_shops = MainShop.eager_load(:shops)
          end

          def show
            @main_shop = MainShop.find_by(eng_name: params[:eng_name])
            @shops = @city.shops.open.where(main_shop_id: @main_shop.id).page(params[:page]).per(params[:per] || PER)
          end

          private

          def set_address
            @prefecture = Prefecture.find_by(name_e: params[:prefecture_name_e])
            @city = @prefecture.cities.find_by(code: params[:city_code])
          end
        end
      end
    end
  end
end
