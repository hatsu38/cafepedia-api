module Api
  module V1
    module All
      class ShopsController < BaseController
        PER = 1000
        def index
          @shops = Shop.where.not(city_id: nil)
                       .select(:id, :main_shop_id, :prefecture_id, :city_id)
                       .page(params[:page])
                       .per(params[:per] || PER)
                       .preload(:main_shop, :city)
        end
      end
    end
  end
end