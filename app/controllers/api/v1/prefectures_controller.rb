module Api
  module V1
    class PrefecturesController < BaseController
      PER = 10
      def index
        # TODO: Active::Hashにeager_loadが存在しないため、ここでだけN+1が起きてしまう
        @prefectures = Prefecture.all.to_a
      end

      def show
        @prefecture = Prefecture.find_by!(name_e: params[:name_e])
        @cities = @prefecture.cities.popular.to_a
        @main_shops = MainShop.popular
        @shops = fetch_shops
      end


      private
      def fetch_shops
        Rails.cache.fetch("prefectures_#{@prefecture.name_e}/#{page_params}_#{per_params}/show_fetch_shops", expires_in: 12.hours) do
          @prefecture.shops
                            .open
                            .have_scocket
                            .have_wifi
                            .eager_load(:main_shop, :city)
                            .page(page_params)
                            .per(per_params)
                            .to_a
        end
      end
    end
  end
end