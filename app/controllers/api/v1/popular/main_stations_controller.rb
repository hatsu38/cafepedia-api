module Api
  module Popular
    class PopularMainShopsController < ApplicationController
      PER = 50
      def index
        @main_shops = MainShop.popular.eager_load(:shops).page(params[:page]).per(params[:per] || PER)
      end
    end
  end
end
