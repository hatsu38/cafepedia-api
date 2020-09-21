module Api
  module V1
    module All
      class ShopsController < ApplicationController
        PER = 1000
        def index
          @shops = Shop.where.not(city_id: nil)
                       .page(params[:page])
                       .per(params[:per] || PER)
                       .preload(:main_shop, :city)
                       .select(:id, :main_shop_id, :prefecture_id, :city_id)
        end
      end
    end
  end
end