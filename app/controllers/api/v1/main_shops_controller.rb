module Api
  module V1
    class MainShopsController < BaseController
      PER = 20
      def index
        @main_shops = fetch_main_shops
      end

      def show
        @main_shop = MainShop.find_by!(eng_name: params[:eng_name])
        @prefectures = Prefecture.popular.to_a
        @stations = Station.popular.preload(:city).page(params[:page]).per(params[:per] || PER)
        @shops = @main_shop.shops
                           .open
                           .have_scocket
                           .have_wifi
                           .eager_load(:city)
                           .page(params[:page])
                           .per(params[:per] || PER)
      end

      private
      def fetch_main_shops
        Rails.cache.fetch("main_shops/index_fetch_main_shops", expires_in: 24.hours) do
          MainShop.all.eager_load(:shops).to_a
        end
      end
    end
  end
end
