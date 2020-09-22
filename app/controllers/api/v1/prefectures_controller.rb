module Api
  module V1
    class PrefecturesController < BaseController
      PER = 10
      def index
        # TODO: Active::Hashにeager_loadが存在しないため、ここでだけN+1が起きてしまう
        @prefectures = Prefecture.all
      end

      def show
        @prefecture = Prefecture.find_by!(name_e: params[:name_e])
        @cities = @prefecture.cities.popular
        @main_shops = MainShop.popular
        @shops = @prefecture.shops
                            .open
                            .have_scocket
                            .have_wifi
                            .eager_load(:main_shop, :city)
                            .page(params[:page])
                            .per(params[:per] || PER)
      end
    end
  end
end