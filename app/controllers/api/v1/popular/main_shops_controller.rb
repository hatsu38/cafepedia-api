module Api
  module V1
    module Popular
      class MainShopsController < BaseController
        PER = 50
        def index
          @main_shops = fetch_popular_main_shops
        end

        private
        def fetch_popular_main_shops
          Rails.cache.fetch("popular/main_shops/#{page_params}_#{per_params}_index_fetch_popular_main_shops", expires_in: 24.hours) do
            MainShop.popular.page(page_params).per(per_params).to_a
          end
        end

        def per_params
          (params[:per] || PER).to_i
        end
      end
    end
  end
end
