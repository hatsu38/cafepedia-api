module Api
  module Shops
    class CommentsController < ApplicationController
      def index
        cafe_lists = Shop.cafe_list_calculated_distance(params)
        @shops = Kaminari.paginate_array(cafe_lists).page(params[:page]).per(params[:per] || PER)
        @main_shops = Shop
                      .includes(:main_shop)
                      .where(id: @shops.map { |c| c['id'] })
                      .pluck(:id, 'main_shops.name', 'main_shops.eng_name', 'main_shops.image')
      end
    end
  end
end